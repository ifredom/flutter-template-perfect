# andorid 问题集锦

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
