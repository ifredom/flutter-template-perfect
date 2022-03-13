# template(模板)

A new Flutter project template with Null-safety.(flutter 完整商用项目模板).

## Getting Starter(开始)

```bash
# dev
> flutter run

# run with Specify entry
> flutter run --target ex/exMain.dart

# build
> flutter build apk
```

### Core functions（核心功能）

- stacked (MVVM 架构)
- route （路由）基于 `auto_route` ，由 **build_runner** 自动生成 ，
- service （服务）基于 `get_it, stacked_service`，内置十种基础懒加载服务 [NavigationService,DialogService,BottomSheetService,SnackbarService] [ConnectivityService,OpenLinkService,ShareService,FileService,LocalStorageService...]
- model （模型）基于 `built_value` ，由 **build_runner** 自动生成
- localization （国际化）基于 `flutter_localizations`，内置中英文 [en,zh]，只需在 **assets/lang** 定义
- common utils（常用函数）位于 utils，内置常见颜色，尺寸[Colour,Distance,validators]

### 1. [stacked (MVVM 架构)](https://pub.flutter-io.cn/packages/stacked)

- A view file controls UI and a model file controls all data（一个文件控制 Ui，一个文件控制所有数据） eg: **XX_view.dart && XX_view_model.dart**

### 2. [service (服务)](https://pub.flutter-io.cn/packages/get_it)

- NavigationService： Router control,router listen (路由服务，控制路由跳转，数据传输，路由监听。路由由指令自动生成。)
- DialogService: Dialog (对话框服务，默认对话框，可定制 UI)
- BottomSheetService： BottomSheet (应用底部提示框服务，可定制 UI)
- SnackbarService： Snackbar (应用顶部提示框服务，可定制 UI)

- ConnectivityService ：Connect to the service. Whether the application is in the foreground or zoomed to the background. Monitor the application lifecycle.(连接服务。应用是否处于前台或缩放到后台。监听应用生命周期。) . use `connectivity_plus` package
- OpenLinkService : launching a URL . use `url_launcher` package
- ShareService : Share . use `share` package
- FileService : File upload, download and save service(文件上传下载保存服务). use `path_provider` package
- LocalStorageService : Local storage service(本地存储服务). use `shared_preferences` package
- AppSettingsService : AppSetting(APP 设置服务). use `app_settings` package
- EnvironmentService : Environment setting(开发/产品 环境服务). use `flutter_dotenv` package
- device_info_plus : get device info (设备信息服务). use `device_info_plus` package
- KeyboardService : Keyboard(键盘服务). use `flutter_keyboard_visibility` package
- HttpService : Http request (API 接口服务，对 dio 进行封装，极易调用). use `dio` package
- StoppableService : Stop called Service (停止服务. 停用已经启用得服务)

<!--

## example Features(e 特色展示)

- Automatic generation model ： route, get_it (自动生成模型：自动生成路由，自动注册服务，自动生成模型及转换方法)
- Bluetooth : search, connect, read/write （蓝牙：搜索，连接硬件，读写数据)
- Map ( 地图 )
- Canvas Chart( 图表 )
- Push ( 极光推送 )
- Webview
- MusicXML Score : render, play ( musicxml 加载五线谱: 渲染，播放 ) -->

## Automatic generation model (自动生成模型)

> 在 cmd 中，导航到项目根目录下运行指令：

```bash
> flutter packages pub run build_runner build --delete-conflicting-outputs

# or(或者)

> flutter packages pub run build_runner watch
```
