import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:template/core/model/ble_devices/ble_devices.dart';
import 'package:template/core/utils/res/gaps.dart';

typedef DeviceTapListener = void Function();

// 可以扫描
class BluelibPage extends StatefulWidget {
  @override
  _BluelibPageState createState() => _BluelibPageState();
}

class _BluelibPageState extends State<BluelibPage> {
  final _log = Logger('BluelibPage');

  bool _beginScan = false;

  BleManager _bleManager = BleManager();

  Peripheral peri;

  final List<BleDevice> bleDevices = <BleDevice>[];

  BluetoothState _bluetoothStatus = BluetoothState.UNKNOWN;

  StreamSubscription<ScanResult> _scanSubscription;

  StreamController<BleDevice> _devicePickerController = StreamController<BleDevice>();

  ValueStream<List<BleDevice>> get visibleDevices => _visibleDevicesController.stream;

  Sink<BleDevice> get devicePicker => _devicePickerController.sink;

  BehaviorSubject<List<BleDevice>> _visibleDevicesController = BehaviorSubject<List<BleDevice>>.seeded(<BleDevice>[]);

  Future<void> _checkPermissions() async {
    // 此方法为运行时，权限检测（ android4.4不支持）
    if (Platform.isAndroid) {
      await _bleManager.enableRadio();
      _bluetoothStatus = await _bleManager.bluetoothState();
      print(_bluetoothStatus);
      if (_bluetoothStatus != BluetoothState.POWERED_ON) {
        return Future.error(Exception("请开启蓝牙"));
      }
    }
  }

  Future<void> _waitForBluetoothPoweredOn() async {
    Completer completer = Completer();
    StreamSubscription<BluetoothState> subscription;
    subscription = _bleManager.observeBluetoothState(emitCurrentValue: true).listen((bluetoothState) async {
      print("_waitForBluetoothPoweredOn: bluetoothState");
      print(bluetoothState);
      if (bluetoothState == BluetoothState.POWERED_ON && !completer.isCompleted) {
        await subscription.cancel();
        completer.complete();
      }
    });
    return completer.future;
  }

  Future<void> refresh() async {
    await _scanSubscription.cancel();
    await _bleManager.stopPeripheralScan();
    await bleDevices.clear();
    _visibleDevicesController.add(bleDevices.sublist(0));
    await _checkPermissions().then((_) => _startScan()).catchError((e) => _log.severe("Couldn't refresh"));
  }

  Future<void> _startScan() async {
    print("开始扫描 _startScan");
    print("\n");

    _scanSubscription = _bleManager.startPeripheralScan().listen((scanResult) async {
      setState(() {
        _beginScan = true;
      });
      String deviceid = scanResult.peripheral.identifier;
      String deviceName = scanResult.advertisementData.localName;
      var bleDevice =
          BleDevice.notConnected(scanResult.peripheral.name, scanResult.peripheral.identifier, scanResult.peripheral);

      // 设备有两个名字 scanResult.peripheral.name 和 scanResult.advertisementData.localName 通常是一样得
      // 设备信号强度 scanResult.rssi

      if (deviceName != null && !bleDevices.contains(bleDevice)) {
        _log.info('发现新设备： $deviceName $deviceid');
        bleDevices.add(bleDevice);
        _visibleDevicesController.add(bleDevices.sublist(0));
      }

      // https://github.com/Polidea/FlutterBleLib/blob/develop/example/lib/test_scenarios/peripheral_test_operations.dart
      // 孙建玲的iPhone 11
      if (deviceid == "D0:11:A8:E5:67:B3") {
        print("找到目标设备： 名称：$deviceName  id值：$deviceid");
        print(scanResult.toString());
        peri = scanResult.peripheral;
        print('停止扫描');
        await _bleManager.stopPeripheralScan();
        setState(() {
          _beginScan = false;
        });

        // peri.observeConnectionState(emitCurrentValue: true, completeOnDisconnect: true).listen((connectionState) {
        //   print("外设【$deviceName ：$deviceid】 连接状态： $connectionState");
        // });
        print('！！！！！！！！准备开始连接=================');
        bool isConnected = await peri.isConnected();
        print("isConnected: $isConnected");

        if (!isConnected) {
          await peri.connect();
          isConnected = await peri.isConnected();
          print('连接之后得状态： $isConnected');
        } //test if connected otherwise getting error connected already
        // debugPrintStack(label: '连接2', maxFrames: 2);
        await peri.discoverAllServicesAndCharacteristics();

        List<Service> services = await peri.services();
        print("打印外围设备名称 \n${peri.name}");
        services.forEach((service) => print("发现服务 \n${service.uuid}"));
        Service service = services.first;
        print("打印第一个服务的uuid \n${service.uuid}");

        List<Peripheral> connectedPeripherals = await _bleManager.connectedPeripherals([service.uuid]);
        print(connectedPeripherals);

        List<Characteristic> characteristics = await service.characteristics();
        characteristics.forEach((characteristic) => print("打印特征值的uuid: ${characteristic.uuid}"));
        Characteristic characteristic = characteristics.first;
        print("打印第一个特征值的uuid \n${characteristic.uuid}");

        debugPrintStack(label: '准备读写', maxFrames: 3);
        await peri.writeCharacteristic(
          service.uuid, // service
          characteristic.uuid, // tx characteristic
          Uint8List.fromList([0x66]),
          false,
        );
        print("写入数据完成");
      }
    });
  }

  /// 参考 https://github.com/leelai/flutter_ble/tree/e7429c445193724fbcd5836f52b7a9f05fac7ed1/lib/devices_list
  Future initBlue() async {
    await _bleManager
        .createClient(
            restoreStateIdentifier: "example-restore-state-identifier",
            restoreStateAction: (peripherals) {
              peripherals?.forEach((peripheral) {
                _log.info("Restored peripheral: ${peripheral.name}");
              });
            })
        .catchError((e) => _log.severe("创建蓝牙client失败"))
        .then((_) => _checkPermissions())
        .catchError((e) => _log.severe("蓝牙开启失败"))
        .then((_) => _waitForBluetoothPoweredOn())
        .then((_) => _startScan());
  }

  Future destroyBlue() async {
    await peri.disconnectOrCancelConnection();
    await _bleManager.destroyClient(); //remember to release native resources when you're done!
  }

  @override
  void initState() {
    super.initState();
    initBlue();
  }

  @override
  void dispose() {
    destroyBlue();
    _scanSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("蓝牙测试 flutter_ble_lib"),
      ),
      body: Column(children: <Widget>[
        Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("开始扫描"),
              onPressed: _startScan,
            ),
            _beginScan
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    ),
                  )
                : Gaps.empty,
          ],
        )),
        Center(
          child: FlatButton(
            child: Text("停止扫描"),
            onPressed: () async {
              setState(() {
                _beginScan = false;
              });
              await _bleManager.stopPeripheralScan();
            },
          ),
        ),
        Center(
          child: FlatButton(
            child: Text("断开连接"),
            onPressed: () async {
              await _bleManager.destroyClient();
            },
          ),
        ),
        Center(
          child: FlatButton(
            child: Text("重新初始化扫描过程"),
            onPressed: () async {
              await initBlue();
            },
          ),
        ),
        Expanded(
          child: StreamBuilder<List<BleDevice>>(
            initialData: visibleDevices.value,
            stream: visibleDevices,
            builder: (context, snapshot) => RefreshIndicator(
              onRefresh: refresh,
              child: DevicesList(_devicePickerController, snapshot.data),
            ),
          ),
        ),
      ]),
    );
  }
}

class DevicesList extends ListView {
  DevicesList(StreamController devicePickerController, List<BleDevice> devices)
      : super.separated(
            separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[300],
                  height: 0,
                  indent: 0,
                ),
            itemCount: devices.length,
            itemBuilder: (context, i) {
              print("Build row for $i");
              return _buildRow(context, devices[i], _createTapListener(devicePickerController, devices[i]));
            });

  static DeviceTapListener _createTapListener(StreamController devicePickerController, BleDevice bleDevice) {
    return () {
      print("clicked device: ${bleDevice.name}");
      devicePickerController.sink.add(bleDevice);
    };
  }

  static Widget _buildRow(BuildContext context, BleDevice device, DeviceTapListener deviceTapListener) {
    return ListTile(
      title: Text(device.name),
      trailing: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Icon(Icons.chevron_right, color: Colors.grey),
      ),
      subtitle: Column(
        children: <Widget>[
          Text(
            device.id.toString(),
            style: TextStyle(fontSize: 10),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      onTap: deviceTapListener,
      contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 12),
    );
  }
}
