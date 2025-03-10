import 'package:app_core/config/dio_config.dart';
import 'package:app_core/config/firebase_config.dart';
import 'package:app_core/config/init_protocol.dart';
import 'package:app_core/config/logs_config.dart';
import 'package:app_core/env/env_config.dart';

abstract interface class ConfigProtocols implements InitProtocols {}

abstract class InitConfig implements ConfigProtocols {
  @override
  Future<void> init() async {
    await LogsConfig().init();
    await DioConfig().init();
    await FirebaseConfig().init();
    await EnvConfig().init();
  }
}
