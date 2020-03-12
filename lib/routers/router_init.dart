import 'package:fluro/fluro.dart';

abstract class IRouterProvider {
  void initRouter(Router router);
}

// typedef IRouterProvider<E> = void Function(Router router);
