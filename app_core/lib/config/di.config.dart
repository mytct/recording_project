// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../env/env_config.dart' as _i0;
import 'device_config.dart' as _i547;
import 'dio_config.dart' as _i175;
import 'firebase_config.dart' as _i352;
import 'remote_config.dart' as _i566;
import 'usecase_config.dart' as _i47;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.factory<_i0.EnvConfig>(() => _i0.EnvConfig());
    gh.factory<_i47.UsecaseConfig>(() => _i47.UsecaseConfig());
    gh.factory<_i175.DioConfig>(() => _i175.DioConfig());
    gh.factory<_i566.RemoteConfig>(() => _i566.RemoteConfig());
    gh.factory<_i547.DeviceConfig>(() => _i547.DeviceConfig());
    gh.factory<_i352.FirebaseConfig>(() => _i352.FirebaseConfig());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    return this;
  }
}

class _$DioModule extends _i175.DioModule {}
