# null safety 空安全

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

1.解决方法一，添加关键字 required。缺点：一旦调用就每个参数必须传值

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

2.解决方法二，提供默认值
```java
void calculate({int factor = 42}) {
  // ...
}
````

3.解决方法三，可取消参数

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

## [空安全定义自己的 model](https://www.raywenderlich.com/21955673-non-nullable-dart-understanding-null-safety)

## [null-safety 操作符](https://gitchat.csdn.net/columnTopic/5e9d22812b34772795872415)

- 空类型声明符 ? 可空类型变量 name，在它使用之前没有被初始化，那么它会被默认初始化为 null。
- 非空断言 ! 使用非空断言 !，强行告诉编译器这是一个不为空的变量。

### 异常捕获

- Null check operator used on a null value
- type 'Null' is not a subtype of type 'String'
