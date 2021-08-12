import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:fluttertemplate/core/model/serializers.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  String get id;

  String get token;

  String? get mobile;

  int? get age;

  String toJson() {
    return json.encode(serializers.serializeWith(User.serializer, this));
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(User.serializer, this) as Map<String, dynamic>;
  }

  factory User.fromJson(String jsonString) {
    return serializers.deserializeWith(
      User.serializer,
      json.decode(jsonString),
    ) as User;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      User.serializer,
      map,
    ) as User;
  }

  User._();
  static Serializer<User> get serializer => _$userSerializer;
  factory User([updates(UserBuilder b)]) = _$User;
}
