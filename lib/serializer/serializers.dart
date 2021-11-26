library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:saccoapp/models/member/maritalstatus.dart';
import 'package:saccoapp/models/payment/paymentmethod.dart';
import 'package:saccoapp/models/member/member.dart';
import 'package:saccoapp/models/deposit/deposit.dart';
import 'package:saccoapp/models/member/user.dart';
import 'package:saccoapp/models/loan/loantype.dart';
import 'package:saccoapp/models/loan/repaymentstatus.dart';
import 'package:saccoapp/models/loan/issuingstatus.dart';
import 'package:saccoapp/models/address/postoffice.dart';
import 'package:saccoapp/models/address/locality.dart';
import 'package:saccoapp/models/address/constituency.dart';
import 'package:saccoapp/models/address/county.dart';
import 'package:saccoapp/models/address/address.dart';
import 'package:saccoapp/models/payment/paymentdetail.dart';
import 'package:saccoapp/models/deposit/mpesastkpushresponse.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  MaritalStatus,
  PaymentMethod,
  Member,
  Deposit,
  User,
  LoanType,
  LoanRepaymentStatus,
  LoanIssuingStatus,
  PostOffice,
  Locality,
  Constituency,
  County,
  Address,
  PaymentDetail,
  MpesaSTKResponse,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
