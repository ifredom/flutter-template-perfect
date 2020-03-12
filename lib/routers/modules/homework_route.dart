import 'package:fluro/fluro.dart';
import '../router_init.dart';
import 'package:chinaculture/pages/homework/homework_index.dart';

class HomeworkRouter implements IRouterProvider {
  static String homeworkIndexPage = "/homeworkIndex";
  static String homeworkDetailPage = "/homeworkDetail";

  @override
  void initRouter(Router router) {
    router.define(homeworkIndexPage,
        handler: Handler(handlerFunc: (_, params) => HomeworkIndex()));
  }
}
