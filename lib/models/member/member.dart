library member;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'maritalstatus.dart';

part 'member.g.dart';

abstract class Member implements Built<Member, MemberBuilder> {
  int get memberId;
  String get identificationNumber;
  String get firstName;
  String get lastName;
  @nullable
  String get otherName;
  String get dateOfBirth;
  String get phoneNumber;
  @nullable
  String get email;
  @nullable
  String get kraPin;
  @nullable
  bool get gender;
  @nullable
  String get passportPhoto;
  @nullable
  MaritalStatus get maritalStatusInfo;

  String get createdAt;
  @nullable
  String get updatedAt;

  Member._();
  factory Member([updates(MemberBuilder memberBuilder)]) = _$Member;
  static Serializer<Member> get serializer => _$memberSerializer;
}
