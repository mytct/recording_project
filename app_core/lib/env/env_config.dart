import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:app_core/config/init_protocol.dart';
import 'package:app_core/config/logs_config.dart';
import 'package:app_core/env/env_dev.dart';
import 'package:app_core/env/env_prod.dart';
import 'package:app_core/env/env_staging.dart';
import 'package:app_core/env/env_uat.dart';

abstract class CoreEnv {
  String get host;
}

enum Env {
  dev,
  prod,
  uat,
  staging;

  static Env initByFlavor() => envFromStr(appFlavor);
}

Env envFromStr(String? envStr) {
  return Env.values.firstWhere(
      (type) => type.toString().split('.').last == envStr,
      orElse: () => Env.dev);
}

abstract interface class EnvConfigProtocols implements InitProtocols {
  CoreEnv getConfig();
}

@injectable
class EnvConfig implements EnvConfigProtocols {
  CoreEnv config = DevEnv();
  Env environmentConfig = Env.dev;

  CoreEnv _getConfig(Env environment) {
    switch (environment) {
      case Env.prod:
        return ProdEnv();
      case Env.uat:
        return UatEnv();
      case Env.staging:
        return StagingEnv();
      default:
        return DevEnv();
    }
  }

  @override
  Future<void> init() async {
    LogsConfig().log(tag);
    final env = Env.initByFlavor();
    config = _getConfig(env);
    environmentConfig = env;
  }

  @override
  String tag = 'EnvConfig';

  @override
  CoreEnv getConfig() => config;
}
