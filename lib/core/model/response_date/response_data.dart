import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:template/core/model/serializers.dart';

part 'response_data.g.dart';

abstract class ResponseData
    implements Built<ResponseData, ResponseDataBuilder> {
  @nullable
  int get code;

  @nullable
  String get data;

  @nullable
  String get msg;

  String toJson() {
    return json
        .encode(serializers.serializeWith(ResponseData.serializer, this));
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(ResponseData.serializer, this);
  }

  factory ResponseData.fromJson(String jsonString) {
    return serializers.deserializeWith(
      ResponseData.serializer,
      json.decode(jsonString),
    );
  }

  factory ResponseData.fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      ResponseData.serializer,
      map,
    );
  }

  ResponseData._();
  static Serializer<ResponseData> get serializer => _$responseDataSerializer;
  factory ResponseData([updates(ResponseDataBuilder b)]) = _$ResponseData;
}
