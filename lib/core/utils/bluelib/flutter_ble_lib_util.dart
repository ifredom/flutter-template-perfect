import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

import 'ble_devices.dart';
import 'blue_config.dart';
import 'device_repository.dart';

typedef DeviceTapListener = void Function();

// 可以蓝牙扫描
class BlueUtils {
  final _log = Logger('BlueUtils');
  final DeviceRepository _deviceRepository;

  final BleManager _bleManager;
  BleManager get bleManager => _bleManager;

  Stream<BleDevice> get pickedDevice => _deviceRepository.pickedDevice.skipWhile((bleDevice) => bleDevice == null);

  late StreamSubscription _devicePickerSubscription;

  late BehaviorSubject<BleDevice> _deviceController;
  ValueStream<BleDevice> get device => _deviceController.stream;

  BehaviorSubject<PeripheralConnectionState> _connectionStateController =
      BehaviorSubject<PeripheralConnectionState>.seeded(PeripheralConnectionState.disconnected);
  ValueStream<PeripheralConnectionState> get connectionState => _connectionStateController.stream;

  // 是否开始扫描
  BehaviorSubject<bool> _scanning = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> get scanning => _scanning;

  // 扫描次数
  num _scanningCount = 0;
  num get scanningCount => _scanningCount;

  num _limitScanningCount = 600; // 扫描次数限制，防止找不到设备时，一直扫描
  num get limitScanningCount => _limitScanningCount;

  final List<BleDevice> _bleDevices = <BleDevice>[];
  List<BleDevice> get bleDevices => _bleDevices;

  BluetoothState _bluetoothStatus = BluetoothState.UNKNOWN;
  BluetoothState get bluetoothStatus => _bluetoothStatus;

  StreamController<BleDevice> _devicePickerController = StreamController<BleDevice>();
  StreamController<BleDevice> get devicePickerController => _devicePickerController;

  Sink<BleDevice> get devicePicker => _devicePickerController.sink;

  BehaviorSubject<List<BleDevice>> _visibleDevicesController = BehaviorSubject<List<BleDevice>>.seeded(<BleDevice>[]);
  ValueStream<List<BleDevice>> get visibleDevices => _visibleDevicesController.stream;

  late Peripheral _peripheral;
  Peripheral get peripheral => _peripheral;
  late ScanResult _deviceResult;

  // 构造，使用测试单一设备，暂时不用
  BlueUtils(this._deviceRepository, this._bleManager) {
    var device = _deviceRepository.pickedDevice.value;
    _deviceController = BehaviorSubject<BleDevice>.seeded(device);

    _connectionStateController = BehaviorSubject<PeripheralConnectionState>.seeded(
        device.isConnected ? PeripheralConnectionState.connected : PeripheralConnectionState.disconnected);

    if (_visibleDevicesController.isClosed) {
      _visibleDevicesController = BehaviorSubject<List<BleDevice>>.seeded(<BleDevice>[]);
    }

    if (_devicePickerController.isClosed) {
      _devicePickerController = StreamController<BleDevice>();
    }

    _devicePickerSubscription = _devicePickerController.stream.listen(_handlePickedDevice);
  }

  /// 参考 https://github.com/leelai/flutter_ble/tree/e7429c445193724fbcd5836f52b7a9f05fac7ed1/lib/devices_list
  // 初始化
  Future init() async {
    _bleDevices.clear();
    await _bleManager
        .createClient(
            restoreStateIdentifier: "example-restore-state-identifier",
            restoreStateAction: (peripherals) {
              peripherals.forEach((peripheral) {
                _log.info("Restored peripheral: ${peripheral.name}");
              });
            })
        .catchError((e) => _log.severe("创建蓝牙client失败"));

    await _checkPermissions()
        .catchError((e) => _log.severe(e))
        .then((_) => _waitForBluetoothPoweredOn())
        .then((_) => _checkLocationPermissions().catchError((e) => _log.severe(e)));
  }

  Future<void> startScan() async {
    print("开始扫描 startScan\n");

    _scanning.add(true);

    _bleManager.startPeripheralScan().listen((scanResult) async {
      _scanningCount += 1;
      if (_scanningCount <= _limitScanningCount) {
        String devicePeripheralName = scanResult.peripheral.name;

        var bleDevice =
            BleDevice.notConnected(scanResult.peripheral.name, scanResult.peripheral.identifier, scanResult.peripheral);

        if (devicePeripheralName != null && !_bleDevices.contains(bleDevice)) {
          _log.info('发现新设备：  ${bleDevice.peripheral}');
          _bleDevices.add(bleDevice);
          _visibleDevicesController.add(_bleDevices.sublist(0));
        }

        // 找到目标设备（Midi硬件设备）就停止扫描
        // https://github.com/Polidea/FlutterBleLib/blob/develop/example/lib/test_scenarios/peripheral_test_operations.dart

        if (scanResult.peripheral.identifier == BlueConfig.temperatureDeviceId) {
          print("找到目标设备： 名称：${scanResult.advertisementData.localName}  id值：${scanResult.peripheral.identifier}");

          _deviceResult = scanResult;
          _peripheral = scanResult.peripheral;

          var findDevice =
              ConnectedBleDevice(scanResult.peripheral.name, scanResult.peripheral.identifier, scanResult.peripheral);
          _deviceController = BehaviorSubject<BleDevice>.seeded(findDevice);

          await stopPeripheralScan();
        }
      } else {
        stopPeripheralScan();
        _scanningCount = 0;
      }
    }, onDone: () {
      print("扫描结束");
      _scanning.add(false);
      connectAndMonitor(_deviceResult);
    });
  }

  initObtaining(Peripheral peripheral) async {
    await peripheral.discoverAllServicesAndCharacteristics();
  }

  Future<void> connectAndMonitor(ScanResult scanResult) async {
    _deviceController.stream.listen((bleDevice) async {});
    Peripheral peripheral = scanResult.peripheral;
    peripheral.observeConnectionState(emitCurrentValue: true, completeOnDisconnect: true).listen((connectionState) {
      _connectionStateController.add(connectionState);
    });

    try {
      _log.info("尝试连接至设备 ${peripheral.name}");
      bool isConnected = await peripheral.isConnected();
      if (!isConnected) {
        await peripheral.connect();
        isConnected = await peripheral.isConnected();
        isConnected ? print("连接成功") : print("连接失败");
      }
      await initObtaining(peripheral);
      String temperatureService = BlueConfig.temperatureService2;
      String temperatureDataCharacteristic = BlueConfig.temperatureDataCharacteristic;

      // await writeCharacteristic(temperatureService, temperatureDataCharacteristic);
      await monitorCharacteristicForPeripheral(peripheral, temperatureService, temperatureDataCharacteristic);
    } on BleError catch (e) {
      _log.severe(e.toString());
    }
  }

  Future<void> writeCharacteristic(serviceUUid, characteristicUUid) async {
    await _peripheral.writeCharacteristic(
      serviceUUid, // service
      characteristicUUid, // tx characteristic
      Uint8List.fromList([0x0c, 0x10, 0x38, 0x38]),
      false,
    );
  }

  // 服务:service   => 特征值：Characteristics  =>  描述：descriptors
  // 作者提示： https://github.com/Polidea/FlutterBleLib/issues/347
  Future<void> monitorCharacteristicForPeripheral(Peripheral peripheral, service, characteristic) async {
    _deviceController.stream.listen((bleDevice) async {
      print("监听：===================================");
      var peripheral = bleDevice.peripheral;

      _startMonitoringTemperature(
          peripheral
              .monitorCharacteristic(BlueConfig.temperatureService2, BlueConfig.temperatureDataCharacteristic,
                  transactionId: "monitor")
              .map((characteristic) {
            print("出数据");
            readCharacteristic(characteristic.value);
            return characteristic.value;
          }), (info) {
        print(info);
      });
    });
  }

  // c++ midi数据转换为ble串行数据
  Future<void> readCharacteristic(Uint8List buffer) async {
    Uint8List readValue = buffer;
    // 0x80 ASCII码
    // 0x是C语言中16进制数的表示方法。
    // 0x80等于十进制的128  Note-off
    // 0x90等于十进制的144 Note On
    // midi设备有127中响应力度，7f

    // print(MyUtils.uint8ToHexStr(readValue));

    List hex16ReadValue = readValue.map((val) => val.toRadixString(16)).toList();
    print(hex16ReadValue);

    print("===============================");
    // return readValue;
  }

  // https://sourcegraph.com/github.com/Polidea/FlutterBleLib@develop/-/blob/example/lib/test_scenarios/peripheral_test_operations.dart#L236
  void _startMonitoringTemperature(Stream<Uint8List> characteristicUpdates, Function log) async {
    StreamSubscription monitoringStreamSubscription = StreamController().stream.listen(print);
    await monitoringStreamSubscription.cancel();
    // 保留：monitoringStreamSubscription = characteristicUpdates.map(_convertToTemperature).listen(
    monitoringStreamSubscription = characteristicUpdates.map((item) {
      // 在这里可以对数据进行转换
      return item;
    }).listen(
      (temperature) {
        // log("监听特征值 : $temperature");
      },
      onError: (error) {
        log("监听特征值时报错 \n$error");
      },
      cancelOnError: true,
    );
  }

  Future<void> _handlePickedDevice(BleDevice bleDevice) async {
    _deviceRepository.pickDevice(bleDevice);
    // await connectAndMonitor();
  }

  void closeDevicePicker() {
    _devicePickerController.close();
  }

  Future stopPeripheralScan() async {
    _scanning.add(false);
    await _bleManager.stopPeripheralScan();
  }

  Future<void> _checkPermissions() async {
    // 此方法为运行时，权限检测（ android4.4不支持）
    if (Platform.isAndroid) {
      Future message = Future.value();
      try {
        _bluetoothStatus = await _bleManager.bluetoothState();

        if (_bluetoothStatus != BluetoothState.POWERED_ON) {
          await _bleManager.enableRadio();
          message = Future.value("蓝牙启动中......");
        } else {
          message = Future.value("蓝牙已启动");
        }
      } catch (e) {
        message = Future.error(Exception("蓝牙开启失败"));
      }
      return message;
    }
  }

  Future<void> _checkLocationPermissions() async {
    Completer completer = Completer();
    // 请求定位权限
    bool isGranted = await Permission.location.request().isGranted;

    if (isGranted) {
      completer.complete();
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.locationWhenInUse,
        Permission.locationAlways,
      ].request();

      if (statuses[Permission.location] == PermissionStatus.granted && !completer.isCompleted) {
        completer.complete("定位权限");
      }
      if (statuses[Permission.locationWhenInUse] == PermissionStatus.granted && !completer.isCompleted) {
        completer.complete("使用时允许");
      }
      if (statuses[Permission.locationAlways] == PermissionStatus.granted && !completer.isCompleted) {
        completer.complete("总是允许");
      }

      completer.completeError(Exception("定位权限未授权"));
    }

    return completer.future;
  }

  Future<void> _waitForBluetoothPoweredOn() async {
    Completer completer = Completer();
    StreamSubscription<BluetoothState> _bluetoothStateSubscription =
        StreamController<BluetoothState>().stream.listen((event) {});
    _bluetoothStateSubscription =
        _bleManager.observeBluetoothState(emitCurrentValue: true).listen((bluetoothState) async {
      if (bluetoothState == BluetoothState.POWERED_ON && !completer.isCompleted) {
        await _bluetoothStateSubscription.cancel();
        completer.complete();
      }
    });
    return completer.future;
  }

  Future<void> refresh() async {
    await _bleManager.stopPeripheralScan();
    _bleDevices.clear();
    _visibleDevicesController.add(_bleDevices.sublist(0));
    await startScan();
  }

  Future<void> disconnect() async {
    disconnectManual();
  }

  Future<void> disconnectManual() async {
    if (await _deviceController.stream.value.peripheral.isConnected()) {
      await _deviceController.stream.value.peripheral.disconnectOrCancelConnection();
    }
  }

  void dispose() async {
    print("销毁页面时调用dispose");
    await disconnect();

    await _scanning.close();
    await _devicePickerSubscription.cancel();
    await _visibleDevicesController.close();

    await _devicePickerController.close();

    _deviceController.value.abandon(); // 丢弃stream.value的数据
    await _deviceController.drain(); // 丢弃stream上的所有数据
    await _deviceController.close();

    await _connectionStateController.drain();
    await _connectionStateController.close();

    await destroyClient();
  }

  Future destroyClient() async {
    await _bleManager.destroyClient(); //remember to release native resources when you're done!
  }
}

class DebugLog {
  String time;
  String content;

  DebugLog(this.time, this.content);
}
