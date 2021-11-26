library county;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'county.g.dart';

abstract class County implements Built<County, CountyBuilder> {
  int get countyId;
  String get countyName;
  String get createdAt;
  @nullable
  String get updatedAt;

  County._();
  factory County([updates(CountyBuilder depositBuilder)]) = _$County;
  static Serializer<County> get serializer => _$countySerializer;
}
