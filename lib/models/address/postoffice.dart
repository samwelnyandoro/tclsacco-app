library postoffice;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'postoffice.g.dart';

abstract class PostOffice implements Built<PostOffice, PostOfficeBuilder> {
  int get postOfficeId;
  String get postOfficeCode;
  String get postOfficeName;
  String get createdAt;
  @nullable
  String get updatedAt;

  PostOffice._();
  factory PostOffice([updates(PostOfficeBuilder depositBuilder)]) =
      _$PostOffice;
  static Serializer<PostOffice> get serializer => _$postOfficeSerializer;
}
