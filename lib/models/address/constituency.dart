library constituency;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'county.dart';

part 'constituency.g.dart';

abstract class Constituency
    implements Built<Constituency, ConstituencyBuilder> {
  int get constituencyId;
  County get county;
  String get constituencyName;
  String get createdAt;
  @nullable
  String get updatedAt;

  Constituency._();
  factory Constituency([updates(ConstituencyBuilder depositBuilder)]) =
      _$Constituency;
  static Serializer<Constituency> get serializer => _$constituencySerializer;
}
