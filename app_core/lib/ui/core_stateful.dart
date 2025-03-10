import 'package:flutter/widgets.dart';
import 'package:app_core/config/logs_config.dart';

abstract class CoreStateful extends StatefulWidget {
  const CoreStateful({super.key});
}

abstract class CoreStatefulState<T extends CoreStateful> extends State<T>
    with LogsConfig {
  @override
  void initState() {
    super.initState();
    initData();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      requestApi();
    });
  }

  @override
  void dispose() {
    clear();
    super.dispose();
  }

  void clear();
  void requestApi();
  void initData();
}
