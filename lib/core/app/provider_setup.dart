import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:template/core/enums/component_state.dart';
import 'package:template/core/model/userinfo/user.dart';
import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/core/services/connectivity/connectivity_service.dart';
import 'locator.dart';


/// List of providers that provider transforms into a widget tree
/// with the main app as the child of that tree, so that the entire
/// app can use these streams anywhere there is a [BuildContext]
///
/// // https://stackoverflow.com/questions/59590673/flutter-app-crash-after-converting-provider-3-to-4
List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  // Provider(create: (_) => ConfigViewModel()),
  // Provider(create: (_) => UserModel()),
];

List<SingleChildWidget> dependentServices = [];

///  参考 UPDATE USING GET IT
///  get_it https://stackoverflow.com/questions/62735538/why-wont-any-changes-from-notifyparser-render-in-the-ui-using-provider-change
List<SingleChildWidget> uiConsumableProviders = [
  StreamProvider<ConnectivityStatus>(
    initialData: ConnectivityStatus.Cellular,
    create: (context) => locator<ConnectivityService>().connectivity$,
  ),
  // 解释: StreamProvider<数据模型>  Provider.of<数据服务>   设置为false,不监听变化数据变化 listen: false
  StreamProvider<User>(
    initialData: User(),
    create: (context) => Provider.of<AuthService>(context, listen: false).user,
  )
];
