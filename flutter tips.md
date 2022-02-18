# Flutter 支持通过自动选择 DPI 依赖资源来加载资产

https://flutter.dev/docs/development/ui/assets-and-images#declaring-resolution-aware-image-assets

## 错误处理方式

https://github.com/cfug/flutter.cn/blob/3ef3c8cfb6e69f5842c3a566931f514c0b945837/src/docs/testing/errors.md

## 错误解决

1. MissingPluginException (MissingPluginException(No implementation found for method check on channel plugins.flutter.io/connectivity)) => 解决办法：新建项目，旧代码移动到全新项目

## built_value

https://stackoverflow.com/questions/64876381/how-to-build-a-list-using-built-value

## keymap 快捷方式

win + E 打开资源管理器

## 经验

BottomNavigationBar + PageView 比用 BottomNavigationBar + IndexedStack 好一点，不用一次性加载完所有 page



## andorid 问题集锦

## android studio plugin 下载很慢，总是超时

直接去[插件市场下载](https://plugins.jetbrains.com/),下载之后解压到 androidstudio 安装目录 plugins 文件夹下

## 编译出错怎么查看更多信息

安卓采用 Gradle 进行构建，所以当出错后我们自然使用 Gradle 查看更多信息，那么 Gradle 在哪里呢？

```bash
// 在你的项目路径下的这里
./android/gradlew
```

```bash
PS >./android/gradlew compileDebug --stacktrace -info
```

## Gradle 错误， 通过 AS 打开 flutter 项目中的 android 文件夹，在 AS 右上侧面有一个 gradle 菜单，点击 Toogle Offline Mode

### [布局约束](https://www.jianshu.com/p/b956b8a37012)


### “error: cannot find symbol” when building for Android in flutter

> flutterEngine.getPlugins().add(new com.example.appsettings.AppSettingsPlugin());
https://stackoverflow.com/questions/66305553/error-cannot-find-symbol-when-building-for-android-in-flutter
