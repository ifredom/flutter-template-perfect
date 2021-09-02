import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:fluttertemplate/core/model/school/teacher.dart';

import '../serializers.dart';

part 'school.g.dart';

abstract class SchoolModel implements Built<SchoolModel, SchoolModelBuilder> {
  String get name;

  BuiltList<TeacherModel> get teacher;
  SchoolModel._();
  factory SchoolModel([void Function(SchoolModelBuilder) updates]) = _$SchoolModel;

  String toJson() {
    return json.encode(serializers.serializeWith(SchoolModel.serializer, this));
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(SchoolModel.serializer, this) as Map<String, dynamic>;
  }

  static SchoolModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(SchoolModel.serializer, json);
  }

  static Serializer<SchoolModel> get serializer => _$schoolModelSerializer;
}
