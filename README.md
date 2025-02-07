# flutter MVVM template

- [中文](./README_ZH.md)

A new Flutter project template with Null-safety.

## Getting Starter

```bash
# dev
> flutter run

# run with Specify entry
> flutter run --target ex/exMain.dart

# build
> flutter build apk
```

### Core functions

- `stacked` : MVVM architecture
- `route` base on `auto_route`, Generate using **build_runner**
- `service` base on `get_it, stacked_service`, for example [NavigationService,DialogService,BottomSheetService,SnackbarService] [ConnectivityService,OpenLinkService,ShareService,FileService,LocalStorageService...]
- `model` base on `built_value` ，Generate using **build_runner**
- `localization` base on `flutter_localizations`，Built in Chinese and English [en,zh]，Define in **assets/lang**
- `common utils` be located **core/utils**，Built in common colors，size[Colour,Distance,validators]

### 1. [stacked](https://pub.flutter-io.cn/packages/stacked)

- A view file controls UI and a model file controls all data. eg: **XX_view.dart && XX_view_model.dart**

### 2. [service ](https://pub.flutter-io.cn/packages/get_it)

- NavigationService： Router control,router listen
- DialogService: Dialog
- BottomSheetService： BottomSheet
- SnackbarService： Snackbar

- ConnectivityService ：Connect to the service. Whether the application is in the foreground or zoomed to the background. Monitor the application lifecycle. use `connectivity_plus` package
- OpenLinkService : launching a URL . use `url_launcher` package
- ShareService : Share . use `share` package
- FileService : File upload, download and save service. use `path_provider` package
- LocalStorageService : Local storage service. use `shared_preferences` package
- AppSettingsService : AppSetting. use `app_settings` package
- EnvironmentService : Environment setting. use `flutter_dotenv` package
- device_info_plus : get device info . use `device_info_plus` package
- KeyboardService : Keyboard. use `flutter_keyboard_visibility` package
- HttpService : Http request. use `dio` package
- StoppableService : Stop called Service

<!--

## example Features(e 特色展示)

- Automatic generation model ： route, get_it (自动生成模型：自动生成路由，自动注册服务，自动生成模型及转换方法)
- Bluetooth : search, connect, read/write （蓝牙：搜索，连接硬件，读写数据)
- Map ( 地图 )
- Canvas Chart( 图表 )
- Push ( 极光推送 )
- Webview
- MusicXML Score : render, play ( musicxml 加载五线谱: 渲染，播放 ) -->

## Automatic generation data model

> Run in the project root directory：

```bash
> flutter packages pub run build_runner build --delete-conflicting-outputs

# or

> flutter packages pub run build_runner watch
```

## generation routing, positioning, and logging models

> Run in the project root directory：

```bash
# Generate routing, positioning, and logging models based on core/app/app.dart
# The result is located in /core/app/
> flutter pub run build_runner build --delete-conflicting-outputs stacked generate
```
