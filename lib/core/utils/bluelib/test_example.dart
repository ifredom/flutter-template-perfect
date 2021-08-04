import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:pianostudent/core/utils/bluelib/ble_devices.dart';
import 'package:pianostudent/core/utils/bluelib/device_repository.dart';
import 'package:pianostudent/core/utils/bluelib/flutter_ble_lib_util.dart';
import 'package:pianostudent/core/utils/res/resources.dart';
import 'package:pianostudent/ui/widgets/appbar/custom_appbar.dart';

typedef DeviceTapListener = void Function();

// 可以扫描
class BluelibPage extends StatefulWidget {
  @override
  _BluelibPageState createState() => _BluelibPageState();
}

class _BluelibPageState extends State<BluelibPage> {
  BlueUtils _blueUtils = new BlueUtils(DeviceRepository(), BleManager());

  final List<BleDevice> bleDevices = <BleDevice>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _blueUtils.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(title: "蓝牙测试 flutter_ble_lib"),
        body: Column(children: <Widget>[
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: Text("初始化"),
                onPressed: () {
                  _blueUtils.init();
                },
              ),
              TextButton(
                child: Text("开始扫描"),
                onPressed: () {
                  var x = 8 | 9;
                  print(x);
                  _blueUtils.startScan();
                  _blueUtils.scanning.stream.listen((event) {
                    print(event);
                  });
                },
              ),
              StreamBuilder(
                  initialData: _blueUtils.scanning.value,
                  stream: _blueUtils.scanning.stream,
                  builder: (context, snap) {
                    Widget result = Gaps.empty;
                    if (snap.data != null) {
                      result = SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey[200],
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                        ),
                      );
                    } else {
                      result = Gaps.empty;
                    }
                    return result;
                  })
            ],
          )),
          Center(
            child: TextButton(
              child: Text("停止扫描"),
              onPressed: () async {
                await _blueUtils.stopPeripheralScan();
              },
            ),
          ),
          Center(
            child: TextButton(
              child: Text("断开连接"),
              onPressed: () async {
                _blueUtils.disconnect();
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<List<BleDevice>>(
              initialData: _blueUtils.visibleDevices.value,
              stream: _blueUtils.visibleDevices,
              builder: (context, snapshot) => RefreshIndicator(
                onRefresh: _blueUtils.refresh,
                child: DevicesList(
                    devicePickerController: _blueUtils.devicePickerController, devices: snapshot.data ?? []),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class DevicesList extends ListView {
  DevicesList({required StreamController devicePickerController, required List<BleDevice> devices})
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
