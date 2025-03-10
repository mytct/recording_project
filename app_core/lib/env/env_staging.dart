import 'package:app_core/env/env_config.dart';

class StagingEnv extends CoreEnv {
  @override
  String get host => 'https://fake-json-api.mock.beeceptor.com';
}
