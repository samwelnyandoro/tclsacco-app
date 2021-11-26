library deposit;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:saccoapp/models/member/member.dart';
import 'package:saccoapp/models/payment/paymentmethod.dart';

part 'deposit.g.dart';

abstract class Deposit implements Built<Deposit, DepositBuilder> {
  int get memberDepositId;
  Member get member;
  PaymentMethod get paymentMethod;
  String get depositAmount;
  @nullable
  String get comment;
  String get createdAt;
  @nullable
  String get updatedAt;

  Deposit._();
  factory Deposit([updates(DepositBuilder depositBuilder)]) = _$Deposit;
  static Serializer<Deposit> get serializer => _$depositSerializer;
}
