# issues

## Try adding either an explicit non-'null' default value or the 'required' modifier.

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