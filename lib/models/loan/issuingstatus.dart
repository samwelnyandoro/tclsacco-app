library issuingstatus;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'issuingstatus.g.dart';

abstract class LoanIssuingStatus
    implements Built<LoanIssuingStatus, LoanIssuingStatusBuilder> {
  int get loanIssuingStatusId;
  String get loanIssuingStatus;
  String get createdAt;
  @nullable
  String get updatedAt;

  LoanIssuingStatus._();
  factory LoanIssuingStatus(
          [updates(LoanIssuingStatusBuilder loanIssuingBuilder)]) =
      _$LoanIssuingStatus;
  static Serializer<LoanIssuingStatus> get serializer =>
      _$loanIssuingStatusSerializer;
}
