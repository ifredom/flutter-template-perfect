import 'package:fluttertemplate/ui/views/home/home_view/home.dart';
import 'package:fluttertemplate/ui/views/login/login_phone_view.dart';
import 'package:fluttertemplate/ui/views/login/login_view.dart';
import 'package:fluttertemplate/ui/views/product_detail/product_detail_view.dart';
import 'package:fluttertemplate/ui/views/register/register_view.dart';
import 'package:fluttertemplate/ui/views/start_up/start_up_view.dart';
import 'package:fluttertemplate/ui/views/update/update_view.dart';
import 'package:stacked/stacked_annotations.dart';

//  需要預解析的 shared_preferences service 报错，所以不采用自动生成
@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: UpdateView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: LoginPhoneView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: ProductDetailView)
  ],
  logger: StackedLogger(),
)
class App {
  /** 除了附加注释之外，没有任何用途 */
}
