import 'package:built_value/built_value.dart';
import 'snack_bar_response.dart';
part 'confirm_snack_bar_response.g.dart';

abstract class ConfirmSnackBarResponse extends SnackBarResponse
    implements Built<ConfirmSnackBarResponse, ConfirmSnackBarResponseBuilder> {
  bool get confirmed;

  ConfirmSnackBarResponse._();
  factory ConfirmSnackBarResponse(
          [void Function(ConfirmSnackBarResponseBuilder) updates]) =
      _$ConfirmSnackBarResponse;
}
