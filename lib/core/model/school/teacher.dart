import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'teacher.g.dart';

abstract class TeacherModel implements Built<TeacherModel, TeacherModelBuilder> {
  String get name;
  int get level;

  TeacherModel._();
  factory TeacherModel([void Function(TeacherModelBuilder) updates]) = _$TeacherModel;

  String toJson() {
    return json.encode(serializers.serializeWith(TeacherModel.serializer, this));
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(TeacherModel.serializer, this) as Map<String, dynamic>;
  }

  static TeacherModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TeacherModel.serializer, json);
  }

  static Serializer<TeacherModel> get serializer => _$teacherModelSerializer;
}
