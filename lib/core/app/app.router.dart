// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../ui/views/home/home_view/home.dart';
import '../../ui/views/login/login_phone_view.dart';
import '../../ui/views/login/login_view.dart';
import '../../ui/views/product_detail/product_detail_view.dart';
import '../../ui/views/register/register_view.dart';
import '../../ui/views/start_up/start_up_view.dart';
import '../../ui/views/update/update_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String updateView = '/update-view';
  static const String homeView = '/home-view';
  static const String loginView = '/login-view';
  static const String loginPhoneView = '/login-phone-view';
  static const String registerView = '/register-view';
  static const String productDetailView = '/product-detail-view';
  static const all = <String>{
    startUpView,
    updateView,
    homeView,
    loginView,
    loginPhoneView,
    registerView,
    productDetailView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.updateView, page: UpdateView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.loginPhoneView, page: LoginPhoneView),
    RouteDef(Routes.registerView, page: RegisterView),
    RouteDef(Routes.productDetailView, page: ProductDetailView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartUpView(),
        settings: data,
      );
    },
    UpdateView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UpdateView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    LoginPhoneView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginPhoneView(),
        settings: data,
      );
    },
    RegisterView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const RegisterView(),
        settings: data,
      );
    },
    ProductDetailView: (data) {
      var args = data.getArgs<ProductDetailViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProductDetailView(
          args.post,
          key: args.key,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ProductDetailView arguments holder class
class ProductDetailViewArguments {
  final Map<dynamic, dynamic> post;
  final Key? key;
  ProductDetailViewArguments({required this.post, this.key});
}
