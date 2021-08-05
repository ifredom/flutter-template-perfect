# issues

## Try adding either an explicit non-'null' default value or the 'required' modifier

解决： 如何创建一个空安全构造函数

```java
class HttpServiceImpl implements HttpService {
  static HttpServiceImpl instance = HttpServiceImpl();  // 必须设置初始值

  HttpServiceImpl() {
    _dio.interceptors.add(LogsInterceptors());
  }
}
```

[空安全](https://stackoverflow.com/questions/64560461/the-parameter-cant-have-a-value-of-null-because-of-its-type-in-dart)

1. 解决方法一，添加关键字 required。缺点：一旦调用就每个参数必须传值

````java
class BottomBarView extends StatefulWidget {
  BottomBarView({Key? key, required this.tabIconsList, required this.changeIndex, required this.addClick}) : super(key: key);

  final Function(int index) changeIndex;
  final Function addClick;
  final List<TabIconData> tabIconsList;
  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> with TickerProviderStateMixin {

}

2. 解决方法二，提供默认值
```java
void calculate({int factor = 42}) {
  // ...
}
````

3. 解决方法三，可取消参数

```java
  class Foo extends StatelessWidget {
  const Foo({Key? key}): super(key: key);

  // ...
}
```

1. 解决方法四，位置参数

### 特殊类型空安全处理

> 动画类 AnimationController ：在 StatefulWidget 中，使用 late 关键字

```dart
class DrawerExample extends StatefulWidget {
  @override
  _DrawerExampleState createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<DrawerExample> {
  late AnimationController sliderAnimationController;  // StatefulWidget 延迟定义  AnimationController
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DrawerUserController(
        screenIndex: DrawerIndex.HOME,
        drawerWidth: MediaQuery.of(context).size.width * 0.75,
        animationController: (AnimationController animationController) {
          sliderAnimationController = animationController;
        },
        screenView: LoginView(), //任何页面
      ),
    );
  }
}
```

> 使用 late 关键字 StreamSubscription<ConnectivityResult> \_subscription;
> Non-nullable instance field '\_subscription' must be initialized.

The argument type 'Function?' can't be assigned to the parameter type 'void Function()?'.

## [null-safety 操作符](https://gitchat.csdn.net/columnTopic/5e9d22812b34772795872415)

- 空类型声明符 ? 可空类型变量 name，在它使用之前没有被初始化，那么它会被默认初始化为 null。
- 非空断言 ! 使用非空断言 !，强行告诉编译器这是一个不为空的变量。

### Null check operator used on a null value

### 异常捕获: type 'Null' is not a subtype of type 'String'

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

### [布局约束](https://www.jianshu.com/p/b956b8a37012)
