# template(模板)

A new Flutter project template with Null-safety.(flutter 完整商用项目模板).

## Getting Starter(开始)

```bash
# run dev
> flutter run
# run with Specify entry
> flutter run --target ex/exMain.dart
# build android apk
> flutter build apk
```

## Features(特色)

- Automatic generation model ： route, get_it (自动生成模型：自动生成路由，自动注册服务，自动生成模型及转换方法)
- Bluetooth : search, connect, read/write （蓝牙：搜索，连接硬件，读写数据)
- Map ( 地图 )
- Canvas Chart( 图表 )
- Push ( 极光推送 )
- Webview
- MusicXML Score : render, play ( musicxml 加载五线谱: 渲染，播放 )

### Core functions（核心功能）

- stacked (MVVM 架构)
- route （路由）基于 `get` ，由 build_runner 自动生成 ，
- service （服务）基于 `get_it, stacked_service` 生成，内置十种基础懒加载服务 [NavigationService,DialogService,BottomSheetService,SnackbarService] [Connectivity,OpenLinkService,ShareService,FileHelperImpl,KeyStorageService...]
- model （模型）基于 `built_value` ，由 build_runner 自动生成
- localization （国际化）基于 `flutter_localizations`，内置中英文 [en,zh]，只需在 assets/lang 定义
- common utils（常用函数）位于 utils，内置常见颜色，尺寸[Colour,Distance,validators]

## Automatic generation model (自动生成模型)

<!-- Project root run (项目根目录下执行命令) -->

> flutter packages pub run build_runner build --delete-conflicting-outputs

<!-- or(或者) -->

> flutter packages pub run build_runner watch

## Adaptation (适配)

<https://juejin.cn/post/6844904176489594893>

> ui/views/start_up_view.dart

```dart
// 初始化缩放比例
ScreenUtil.init(
  BoxConstraints(
    maxWidth: MediaQuery.of(context).size.width,
    maxHeight: MediaQuery.of(context).size.height,
  ),
  designSize: Size(750, 1334), // 设计稿尺寸
  orientation: Orientation.portrait,
);
```

