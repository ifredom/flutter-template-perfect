typedef void EventCallback(arg);

// 事件总线

class EventBus {
   
  // 私有构造函数
  EventBus._internal();

  // 保存单例
  static EventBus _singleton = EventBus._internal();

  // 工厂构造函数
  factory EventBus() => _singleton;

  // 保存事件订阅队列
  var _emap = new Map<Object, List<EventCallback>>();

  // 添加订阅者
  void on(eventName, EventCallback f) {
    if (eventName == null) return;
    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(f);
  }

  // 移除订阅者

  void off(eventName, [EventCallback f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return; // 无订阅者
    if (list == null) {
      _emap[eventName] = null; // 置空的需求
    } else {
      _emap[eventName].remove(f);
    }
  }

  // 通知订阅者
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    print(list);
    var len = list.length - 1;

    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}

//定义一个top-level变量，页面引入该文件后可以直接使用bus
var bus = new EventBus();

// 使用示例：
// 登录页A中
// bus.on("login", (arg) {
//   // do something
// });

// 登录页B中
// 登录成功后触发登录事件，页面A中订阅者会被调用
// bus.emit("login", userInfo);
