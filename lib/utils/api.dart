import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'network.dart';
import 'package:saccoapp/serializer/serializers.dart';

import 'package:saccoapp/models/member/user.dart';
import 'package:saccoapp/models/deposit/deposit.dart';
import 'package:saccoapp/models/address/address.dart';
import 'package:saccoapp/models/loan/memberloan.dart';
import 'package:saccoapp/models/payment/paymentdetail.dart';
import 'package:saccoapp/models/deposit/mpesastkpushresponse.dart';

class SaccoAPI {
  NetworkUtil _netUtil = new NetworkUtil();
  static final String baseUrl = 'https://apisedc.appspot.com/api';
  int memberId;
  String phoneNumber;

  Future<User> login(String username, String password) async {
    final String loginUrl = 'https://apisedc.appspot.com/oauth/token';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _netUtil.post(loginUrl, body: {
      'grant_type': 'password',
      'client_id': '2',
      'client_secret': 'hxHuyF3dT62IFJbfTMHGczlYCKOuzySYYnrey1CS',
      'username': username,
      'password': password,
      'scope': '*'
    }).then((dynamic res) {
      prefs.setString('bearerToken', res['access_token']);
    });

    return _netUtil.get('$baseUrl/user').then((dynamic res) {
      return serializers.deserializeWith(User.serializer, res);
    });
  }

  Future<List<Deposit>> fetchDeposits() async {
    await getSharedPreferences();

    final String depositsUrl = '$baseUrl/memberdeposits/members/$memberId';

    return _netUtil.get(depositsUrl).then((dynamic res) {
      if (res == null) return null;
      return res
          .map<Deposit>((deposit) =>
              serializers.deserializeWith(Deposit.serializer, deposit))
          .toList();
    });
  }

  Future<List<Address>> fetchAddresses() async {
    await getSharedPreferences();
    final String addressesUrl = '$baseUrl/addressdetails/members/$memberId';

    return _netUtil.get(addressesUrl).then((dynamic res) {
      if (res == null) return null;
      return res
          .map<Address>((address) =>
              serializers.deserializeWith(Address.serializer, address))
          .toList();
    });
  }

  Future<List<MemberLoan>> fetchLoans() async {
    await getSharedPreferences();
    final String memberLoansUrl = '$baseUrl/loans/member/$memberId';

    return _netUtil.get(memberLoansUrl).then((dynamic res) {
      if (res == null) return null;
      return res
          .map<MemberLoan>((memberLoan) =>
              serializers.deserializeWith(MemberLoan.serializer, memberLoan))
          .toList();
    });
  }

  Future<List<PaymentDetail>> fetchPaymentDetails() async {
    await getSharedPreferences();
    final String paymentDetails = '$baseUrl/paymentdetails/members/$memberId';

    return _netUtil.get(paymentDetails).then((dynamic res) {
      if (res == null) return null;
      return res
          .map<PaymentDetail>((paymentDetail) => serializers.deserializeWith(
              PaymentDetail.serializer, paymentDetail))
          .toList();
    });
  }

  Future<MpesaSTKResponse> mpesaDeposit(
      String depositAmount) async {
    await getSharedPreferences();
    final String mpesaDepositUrl =
        '$baseUrl/memberdeposits/account/lipanampesa';
    return _netUtil.post(mpesaDepositUrl, body: {
      'member_id': memberId.toString(),
      'phone_number': phoneNumber,
      'deposit_amount': depositAmount
    }).then((dynamic res) {
      return serializers.deserializeWith(
          MpesaSTKResponse.serializer, res);
    });
  }

  getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    memberId = prefs.getInt('memberId');
    phoneNumber = prefs.getString('phoneNumber');
  }
}
