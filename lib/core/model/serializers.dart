library serializers;

import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'teacher/teacher_home_bean.dart';

import 'alert_request/confirm_alert_request.dart';
import 'alert_response/confirm_alert_response.dart';
import 'response_date/response_data.dart';
import 'snack_bar_request/confirm_snack_bar_request.dart';
import 'snack_bar_response/confirm_snack_bar_response.dart';
import 'teachingbook/teachingbook.dart';
import 'userinfo/user.dart';

part 'serializers.g.dart';

/// List of models that will have a serializer generated for them.
///   - Usually you only add models here that you expect to fetch from some API
@SerializersFor([
  User,
  TeacherHomeBean,
  ConfirmAlertRequest,
  ConfirmAlertResponse,
  ConfirmSnackBarRequest,
  ConfirmSnackBarResponse,
  ResponseData,
  Teachingbook,
])

/// Can add additional plugins that will serialize types like [DateTime]
///   - It is also possible to write your own Serializer plugins for type that
///     are not supported by default.
///   - For Example: https://github.com/google/built_value.dart/issues/543
///     implements [SerializerPlugin] and writes a serializer for Firebase
///     Datetime that converts TimeStamp or DateTime to integers.
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();
