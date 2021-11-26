library locality;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'constituency.dart';

part 'locality.g.dart';

abstract class Locality implements Built<Locality, LocalityBuilder> {
  int get localityId;
  Constituency get constituency;
  String get localityName;
  String get createdAt;
  @nullable
  String get updatedAt;

  Locality._();
  factory Locality([updates(LocalityBuilder depositBuilder)]) = _$Locality;
  static Serializer<Locality> get serializer => _$localitySerializer;
}
