library memberloan;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:saccoapp/models/member/member.dart';
import 'loantype.dart';
import 'repaymentstatus.dart';
import 'issuingstatus.dart';

part 'memberloan.g.dart';

abstract class MemberLoan implements Built<MemberLoan, MemberLoanBuilder> {
  int get memberLoanId;
  Member get member;
  LoanType get loanType;
  String get loanPurpose;
  double get loanAmount;
  String get repaymentPeriod;
  LoanRepaymentStatus get loanRepaymentStatus;
  LoanIssuingStatus get loanIssuingStatus;
  String get createdAt;
  @nullable
  String get updatedAt;

  MemberLoan._();
  factory MemberLoan([updates(MemberLoanBuilder depositBuilder)]) =
      _$MemberLoan;
  static Serializer<MemberLoan> get serializer => _$memberLoanSerializer;
}
