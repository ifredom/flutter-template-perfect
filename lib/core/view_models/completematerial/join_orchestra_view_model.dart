import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/locator.dart';
import '../base_view_model.dart';

class JoinOrchestraViewModel extends BaseViewModel {
  String _invitationCode;
  String get invitationCode => _invitationCode;

  void updateInvitationCode(String code) {
    _invitationCode = code;
  }
}
