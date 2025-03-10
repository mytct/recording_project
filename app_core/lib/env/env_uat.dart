import 'package:app_core/env/env_config.dart';

class UatEnv extends CoreEnv {
  @override
  String get host => 'https://fake-json-api-uat.mock.beeceptor.com';
}
