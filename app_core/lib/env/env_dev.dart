import 'package:wismobile_core/env/env_config.dart';

class DevEnv extends CoreEnv {
  @override
  String get host => 'https://fake-json-api.mock.beeceptor.com';
}
