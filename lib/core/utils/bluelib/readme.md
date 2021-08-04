# bluelib 解释

源码参考: https://github.com/Polidea/FlutterBleLib/blob/develop/example/lib/test_scenarios/peripheral_test_operations.dart


https://blog.csdn.net/hjjdehao/article/details/104280422

## rxadart 3大类

[rxdart 中的subject 与streamController区别](https://blog.csdn.net/hjjdehao/article/details/104280422)
[streamController介绍](https://wizardforcel.gitbooks.io/gsyflutterbook/content/Flutter-11.html)
[BehaviorSubject--PublishSubject--ReplaySubject](https://dltlabs.medium.com/simplifying-subjects-in-rxdart-2ea6fe94495)

* PublishSubject
* BehaviorSubject
* ReplaySubject

## rxadart 类上的属性方法

BehaviorSubject.seeded() // 初始化状态，并立即发出信息
valueStream
sink

## stream 方法

await \_scanSubscription?.cancel();

\_deviceController?.value?.abandon();
\_deviceController?.drain(); // 丢弃所有数据
\_deviceController?.close();

## rxdart 中的 PublishSubject 用法

> 为了防止内存泄漏，一定要调用 cancel()进行释放;

```dart
<!-- 创建  -->
  final PublishSubject obs = PublishSubject<int>();
  int count = 0;

<!-- 操作 +  监听 -->
  obs.where((val) => val.isOdd).listen((val) => print("$val"));

<!-- 发布消息 -->
count++;
obs.add(count);
```

## 蓝牙特征值介绍

https://juejin.cn/post/6844903617523105805
