import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:template/core/model/serializers.dart';

part 'teachingbook.g.dart';

abstract class Teachingbook
    implements Built<Teachingbook, TeachingbookBuilder> {
  String get id;

  @nullable
  String get bookName;

  @nullable
  String get publisherCode;

  @nullable
  String get publisherName;

  @nullable
  int get orderNo;

  @nullable
  String get coverImageId;

  @nullable
  int get validFlag;

  String toJson() {
    return json
        .encode(serializers.serializeWith(Teachingbook.serializer, this));
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(Teachingbook.serializer, this);
  }

  factory Teachingbook.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Teachingbook.serializer,
      json.decode(jsonString),
    );
  }

  factory Teachingbook.fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      Teachingbook.serializer,
      map,
    );
  }

  Teachingbook._();
  static Serializer<Teachingbook> get serializer => _$teachingbookSerializer;
  factory Teachingbook([updates(TeachingbookBuilder b)]) = _$Teachingbook;
}
