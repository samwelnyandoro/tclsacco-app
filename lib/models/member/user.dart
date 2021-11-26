library user;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'member.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  int get userId;
  String get userName;
  String get email;
  String get phoneNumber;
  String get accessLevel;
  @nullable
  Member get member;
  String get createdAt;
  @nullable
  String get updatedAt;

  User._();
  factory User([updates(UserBuilder userBuilder)]) = _$User;
  static Serializer<User> get serializer => _$userSerializer;
}
