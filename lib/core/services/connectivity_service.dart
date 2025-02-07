import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertemplate/core/app/app.logger.dart';
import 'package:fluttertemplate/core/constants/component_state.dart';

import 'stoppable_service.dart';

// document:  https://pub.dev/packages/connectivity_plus

class ConnectivityService implements StoppableService {
  final _log = getLogger("ConnectivityService");
  final StreamController<ConnectivityStatus> _connectivityResultController = StreamController<ConnectivityStatus>();

  ConnectivityResult _lastResult = ConnectivityResult.none;
  ConnectivityResult get lastConnectivity => _lastResult;

  late StreamSubscription<List<ConnectivityResult>> _subscription;

  bool _serviceStopped = false;
  @override
  bool get serviceStopped => _serviceStopped;

  final _connectivity = Connectivity();
  Stream<ConnectivityStatus> get connectivity$ => _connectivityResultController.stream;

  ConnectivityService() {
    _subscription = _connectivity.onConnectivityChanged.listen(_emitConnectivity);
    _connectivityResultController.add(ConnectivityStatus.Init);
  }

  Future<bool> get isConnected async {
    final connectivityResult = await _connectivity.checkConnectivity();
    _log.i('Connectivity result: $connectivityResult');

    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
    } else if (connectivityResult.contains(ConnectivityResult.none)) {}
    return false;
  }

  @override
  void start() async {
    _log.w('ConnectivityService resumed');
    _serviceStopped = false;

    await _resumeSignal();
    _subscription.resume();
  }

  @override
  void stop() {
    _log.w('ConnectivityService paused');
    _serviceStopped = true;

    _subscription.pause(_resumeSignal());
  }

  void _emitConnectivity(List<ConnectivityResult> result) {
    final isChangeStatus = result.isNotEmpty && !result.contains(ConnectivityResult.none);

    _log.i('Connectivity status changed to ${result.last}');

    if (isChangeStatus) {
      _log.i('New data received.');
    }

    _connectivityResultController.add(_convertResult(result.last));
    _lastResult = result.last;
  }

  ConnectivityStatus _convertResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }

  Future<void> _resumeSignal() async => true;
}
