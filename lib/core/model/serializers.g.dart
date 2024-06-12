// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(SchoolModel.serializer)
      ..add(StudentModel.serializer)
      ..add(TeacherModel.serializer)
      ..add(User.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(StudentModel)]),
          () => new ListBuilder<StudentModel>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TeacherModel)]),
          () => new ListBuilder<TeacherModel>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
