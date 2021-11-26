library repaymentstatus;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'repaymentstatus.g.dart';

abstract class LoanRepaymentStatus
    implements Built<LoanRepaymentStatus, LoanRepaymentStatusBuilder> {
  int get loanRepaymentStatusId;
  String get loanRepaymentStatus;
  String get createdAt;
  @nullable
  String get updatedAt;

  LoanRepaymentStatus._();
  factory LoanRepaymentStatus(
          [updates(LoanRepaymentStatusBuilder loanRepaymentBuilder)]) =
      _$LoanRepaymentStatus;
  static Serializer<LoanRepaymentStatus> get serializer =>
      _$loanRepaymentStatusSerializer;
}
