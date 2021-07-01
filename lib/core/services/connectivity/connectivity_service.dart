import 'package:template/core/enums/component_state.dart';
import '../stoppable_service.dart';

abstract class ConnectivityService implements StoppableService {
  Stream<ConnectivityStatus> get connectivity$;

  Future<bool> get isConnected;
}
