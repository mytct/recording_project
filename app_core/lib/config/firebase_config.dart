import 'package:injectable/injectable.dart';
import 'package:app_core/config/logs_config.dart';

@injectable
class FirebaseConfig with LogsConfig {
  @override
  String tag = 'FirebaseConfig';
}
