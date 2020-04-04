import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:template/core/model/serializers.dart';

part 'teacher_home_bean.g.dart';

abstract class TeacherHomeBean
    implements Built<TeacherHomeBean, TeacherHomeBeanBuilder> {
  @nullable
  String get nickName;

  @nullable
  String get userImageId;

  @nullable
  String get levelCode;

  String get messageIcon;

  String get homeWorkIcon;

  String get studentIcon;

  String get teachingPlanIcon;
  

  int get checkingState;

  String toJson() {
    return json
        .encode(serializers.serializeWith(TeacherHomeBean.serializer, this));
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(TeacherHomeBean.serializer, this);
  }

  factory TeacherHomeBean.fromJson(String jsonString) {
    return serializers.deserializeWith(
      TeacherHomeBean.serializer,
      json.decode(jsonString),
    );
  }

  factory TeacherHomeBean.fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      TeacherHomeBean.serializer,
      map,
    );
  }

  TeacherHomeBean._();
  static Serializer<TeacherHomeBean> get serializer =>
      _$teacherHomeBeanSerializer;
  factory TeacherHomeBean([updates(TeacherHomeBeanBuilder b)]) =
      _$TeacherHomeBean;
}
