import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'student.g.dart';

abstract class StudentModel implements Built<StudentModel, StudentModelBuilder> {
  String get name;

  int get level;

  BuiltList<StudentModel> get students;

  StudentModel._();
  factory StudentModel([void Function(StudentModelBuilder) updates]) = _$StudentModel;

  String toJson() {
    return json.encode(serializers.serializeWith(StudentModel.serializer, this));
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(StudentModel.serializer, this) as Map<String, dynamic>;
  }

  static StudentModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(StudentModel.serializer, json);
  }

  static Serializer<StudentModel> get serializer => _$studentModelSerializer;
}
