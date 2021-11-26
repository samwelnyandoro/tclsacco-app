library paymentdetail;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:saccoapp/models/member/member.dart';
import 'paymentmethod.dart';

part 'paymentdetail.g.dart';

abstract class PaymentDetail
    implements Built<PaymentDetail, PaymentDetailBuilder> {
  int get paymentDetailsId;
  PaymentMethod get paymentMethod;
  Member get member;
  @nullable
  String get bankName;
  @nullable
  String get bankAccountNumber;
  @nullable
  String get cardNumber;
  @nullable
  String get serviceProvider;
  @nullable
  String get phoneNumber;
  String get createdAt;
  @nullable
  String get updatedAt;

  PaymentDetail._();
  factory PaymentDetail([updates(PaymentDetailBuilder paymentDetailsBuilder)]) =
      _$PaymentDetail;
  static Serializer<PaymentDetail> get serializer => _$paymentDetailSerializer;
}
