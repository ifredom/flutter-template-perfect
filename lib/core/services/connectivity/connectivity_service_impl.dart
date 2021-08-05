import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:logging/logging.dart';
import 'package:fluter_template_perfect/core/enums/component_state.dart';
import 'connectivity_service.dart';

class ConnectivityServiceImpl implements ConnectivityService {
  final _log = Logger("ConnectivityServiceImpl");
  final _connectivityResultController = StreamController<ConnectivityStatus>();
  final _connectivity = Connectivity();

  ConnectivityResult _lastResult = ConnectivityResult.none;
  late StreamSubscription<ConnectivityResult> _subscription =
      _connectivity.onConnectivityChanged.listen(_emitConnectivity);
  bool _serviceStopped = false;

  @override
  Stream<ConnectivityStatus> get connectivity$ => _connectivityResultController.stream;

  bool get serviceStopped => _serviceStopped;

  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();

    switch (result) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        return true;
      case ConnectivityResult.none:
      default:
        return false;
    }
  }

  @override
  void start() async {
    _log.info('ConnectivityService resumed');
    _serviceStopped = false;

    await _resumeSignal();
    _subscription.resume();
  }

  @override
  void stop() {
    _log.info('ConnectivityService paused');
    _serviceStopped = true;

    _subscription.pause(_resumeSignal());
  }

  void _emitConnectivity(ConnectivityResult event) {
    if (event == _lastResult) return;

    _log.info('Connectivity status changed to $event');
    _connectivityResultController.add(_convertResult(event));
    _lastResult = event;
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
