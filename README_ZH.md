# 模板

这是一个 flutter 完整商用项目模板

## 开始

```bash
# 开发
> flutter run

# 通过指定入口文件运行
> flutter run --target ex/exMain.dart

# 构建
> flutter build apk
```

### 核心功能

- stacked (MVVM 架构)
- route （路由）基于 `auto_route` ，由 **build_runner** 自动生成 ，
- service （服务）基于 `get_it, stacked_service`，内置十种基础懒加载服务 [NavigationService,DialogService,BottomSheetService,SnackbarService] [ConnectivityService,OpenLinkService,ShareService,FileService,LocalStorageService...]
- model （模型）基于 `built_value` ，由 **build_runner** 自动生成
- localization （国际化）基于 `flutter_localizations`，内置中英文 [en,zh]，只需在 **assets/lang** 定义
- common utils（常用函数）位于 utils，内置常见颜色，尺寸[Colour,Distance,validators]

### 1. [MVVM 架构](https://pub.flutter-io.cn/packages/stacked)

- 一个文件管理 Ui eg: **XX_view.dart**
- 一个文件管理数据 eg: **XX_view_model.dart**

### 2. [服务](https://pub.flutter-io.cn/packages/get_it)

- NavigationService： 路由服务，控制路由跳转，数据传输，路由监听。路由由指令自动生成。
- DialogService: 对话框服务，默认对话框，可定制 UI
- BottomSheetService： 应用底部提示框服务，可定制 UI
- SnackbarService： 应用顶部提示框服务，可定制 UI

- ConnectivityService ：连接服务。应用是否处于前台或缩放到后台。监听应用生命周期。使用包 `connectivity_plus`
- OpenLinkService : 通过链接打开一个 App. 使用包 `url_launcher`
- ShareService : 分享. 使用包 `share`
- FileService : 文件上传下载保存服务. 使用包 `path_provider`
- LocalStorageService : 本地存储服务. 使用包 `shared_preferences`
- AppSettingsService : 打开 APP 设置服务. 使用包 `app_settings`
- EnvironmentService : 开发/产品 环境服务. 使用包 `flutter_dotenv`
- device_info_plus : 获取设备信息服务. 使用包 `device_info_plus`
- KeyboardService : 获取键盘状态服务. 使用包 `flutter_keyboard_visibility`
- HttpService : Http 接口请求服务. 使用包 `dio`
- StoppableService : 停止服务. 对已启动得服务进行控制管理,停用已经启用得服务

<!--

## example Features(e 特色展示)

- Automatic generation model ： route, get_it (自动生成模型：自动生成路由，自动注册服务，自动生成模型及转换方法)
- Bluetooth : search, connect, read/write （蓝牙：搜索，连接硬件，读写数据)
- Map ( 地图 )
- Canvas Chart( 图表 )
- Push ( 极光推送 )
- Webview
- MusicXML Score : render, play ( musicxml 加载五线谱: 渲染，播放 ) -->

## 自动生成模型

> 在 cmd 中，项目根目录下运行以下指令：

```bash
> flutter packages pub run build_runner build --delete-conflicting-outputs

# or(或者)

> flutter packages pub run build_runner watch
```
