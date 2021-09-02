library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:fluttertemplate/core/model/school/school.dart';
import 'package:fluttertemplate/core/model/school/student.dart';
import 'package:fluttertemplate/core/model/school/teacher.dart';

import 'userinfo/user.dart';

part 'serializers.g.dart';

@SerializersFor([
  User,
  SchoolModel,
  TeacherModel,
  StudentModel,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();
