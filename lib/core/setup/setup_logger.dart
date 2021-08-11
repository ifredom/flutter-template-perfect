import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:logger/logger.dart' as fancy;

void setupLogger() {
  Logger.root.level = kReleaseMode ? Level.OFF : Level.ALL;
  Logger.root.onRecord.listen((record) {
    var m = '${record.loggerName} ${record.level.name}: ${record.time}: ${record.message}';
    var log = _getLogger();

    if (record.level == Level.SEVERE) {
      log.wtf(m);
    } else if (record.level == Level.SHOUT) {
      log.e(m);
    } else if (record.level == Level.WARNING) {
      log.w(m);
    } else if (record.level == Level.INFO) {
      log.i(m);
    } else if (record.level == Level.FINE) {
      log.d(m);
    } else if (record.level == Level.FINER) {
    } else if (record.level == Level.FINEST) {
    } else {
      log.v(m);
    }
  });
}

fancy.Logger _getLogger() {
  return fancy.Logger(printer: _SimpleLogPrinter());
}

class _SimpleLogPrinter extends fancy.LogPrinter {
  @override
  List<String> log(fancy.LogEvent event) {
    var color = fancy.PrettyPrinter.levelColors[event.level];
    var emoji = fancy.PrettyPrinter.levelEmojis[event.level];
    return [color!('$emoji: ${event.message}')];
  }
}
