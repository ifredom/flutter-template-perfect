import 'package:fluttertemplate/core/utils/res/local_storage_keys.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// 读取 .env 文件值
class EnvironmentService {
  String getValue(String key, {bool verbose = false}) {
    final value = dotenv.env[key] ?? StorageKeys.NoKey;
    if (verbose) print('key:$key value:$value');
    return value;
  }

  static Future<EnvironmentService> getInstance() async {
    print('Load environment');
    await dotenv.load(fileName: ".env");
    print('Environement loaded');
    return Future.value(EnvironmentService());
  }
}
