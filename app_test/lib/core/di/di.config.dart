// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/audio_list/bloc/audio_list_cubit.dart' as _i279;
import '../../features/record/bloc/record_cubit.dart' as _i622;
import '../services/audio_play_service.dart' as _i1053;
import '../services/local_audio_services.dart' as _i979;
import 'di.dart' as _i913;

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
    final registerModule = _$RegisterModule();
    gh.factory<_i279.AudioListCubit>(() => _i279.AudioListCubit());
    gh.factory<_i622.RecordCubit>(() => _i622.RecordCubit());
    gh.lazySingleton<_i979.LocalAudioService>(() => registerModule.recorder);
    gh.lazySingleton<_i1053.AudioPlayService>(() => registerModule.player);
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}
