import 'package:injectable/injectable.dart';
import 'package:app_core/config/logs_config.dart';

@injectable
class RemoteConfig with LogsConfig {
  @override
  String tag = 'RemoteConfig';
}
