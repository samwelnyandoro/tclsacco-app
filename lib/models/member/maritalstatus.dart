library maritalstatus;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'maritalstatus.g.dart';

abstract class MaritalStatus
    implements Built<MaritalStatus, MaritalStatusBuilder> {
  int get maritalStatusId;
  @nullable
  String get maritalStatus;
  String get createdAt;
  @nullable
  String get updatedAt;

  MaritalStatus._();
  factory MaritalStatus([updates(MaritalStatusBuilder maritalStatusBuilder)]) =
      _$MaritalStatus;
  static Serializer<MaritalStatus> get serializer => _$maritalStatusSerializer;
}
