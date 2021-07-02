# template(模板)

A new Flutter project template(flutter完整商用项目模板).

* flutter version: 2.2.0

## Getting Starter(开始)

> flutter run

## Features(演示功能)

* 蓝牙搜索，连接硬件设备，互传数据 (Bluetooth)
* 地图 ( Map )
* 图表（ Canvas ）
* 极光推送 ( Push )
* webview
* 乐器曲谱( Score )

## Automatic generation model (自动生成模型)

[Instructional video(教学视频)](https://www.youtube.com/watch?v=hNbOSSgpneI)

* Create model file (创建文件，模型示例)
* Executive order(执行命令)

[Model example(模型示例)](https://www.stacksecrets.com/flutter/how-to-use-built_value-library)

```dash

import 'package:built_value/built_value.dart';

part 'testmode.g.dart';

abstract class Testmode implements Built<Testmode, TestmodeBuilder> {
  @nullable
  String get id;

  @nullable
  String get token;

  String get name;

  Testmode._();
  factory Testmode([updates(TestmodeBuilder b)]) = _$Testmode;
}
```

<!-- Project root run (项目根目录下执行命令) -->
> flutter packages pub run build_runner build
<!-- or(或者) -->
> flutter packages pub run build_runner watch

<!-- other parameter(其他参数)：  --delete-conflicting-outputs -->



Verovio