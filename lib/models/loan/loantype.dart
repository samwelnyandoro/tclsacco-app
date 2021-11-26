library loantype;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'loantype.g.dart';

abstract class LoanType implements Built<LoanType, LoanTypeBuilder> {
  int get loanTypeId;
  String get loanTypeName;
  String get createdAt;
  @nullable
  String get updatedAt;

  LoanType._();
  factory LoanType([updates(LoanTypeBuilder depositBuilder)]) = _$LoanType;
  static Serializer<LoanType> get serializer => _$loanTypeSerializer;
}
