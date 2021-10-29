import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:fluttertemplate/core/app/app.logger.dart';
import 'package:fluttertemplate/core/constants/component_state.dart';

import 'stoppable_service.dart';

// 参考 https://github.com/TobiCrackIT/Tri-fold/tree/07f26c926bd3728f42f7a6e407dc7186509468c5/lib/core/services/app_service

class ConnectivityService implements StoppableService {
  final _log = getLogger("ConnectivityService");
  StreamController<ConnectivityStatus> _connectivityResultController = StreamController<ConnectivityStatus>();

  ConnectivityResult _lastResult = ConnectivityResult.none;

  late StreamSubscription<ConnectivityResult> _subscription;

  bool _serviceStopped = false;
  bool get serviceStopped => _serviceStopped;

  final _connectivity = Connectivity();
  Stream<ConnectivityStatus> get connectivity$ => _connectivityResultController.stream;

  ConnectivityService() {
    _subscription = _connectivity.onConnectivityChanged.listen(_emitConnectivity);
    _connectivityResultController.add(ConnectivityStatus.Init);
    _connectivity.onConnectivityChanged
        .listen((ConnectivityResult result) => _connectivityResultController.add(_convertResult(result)));
  }

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

  void start() async {
    _log.w('ConnectivityService resumed');
    _serviceStopped = false;

    await _resumeSignal();
    _subscription.resume();
  }

  void stop() {
    _log.w('ConnectivityService paused');
    _serviceStopped = true;

    _subscription.pause(_resumeSignal());
  }

  void _emitConnectivity(ConnectivityResult event) {
    if (event == _lastResult) return;

    _log.i('Connectivity status changed to $event');
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
