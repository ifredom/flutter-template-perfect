import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/app/app.locator.dart';
import 'package:fluttertemplate/core/app/app.router.dart';
import 'package:fluttertemplate/core/utils/common/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel with Validators {
  final _navigationService = locator<NavigationService>();
  NavigationService get navigationService => _navigationService;

  onModelReady() {}

  Future<void> loginWithPassword(String username, String password) async {
    setBusy(true);
    Future.delayed(Duration(milliseconds: 500), () async {
      setBusy(false);
      await _navigationService.replaceWith(Routes.homeView);
    });
  }
}
