import 'package:app_test/core/services/audio_play_service.dart';
import 'package:app_test/core/services/local_audio_services.dart';

import 'di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final di = GetIt.instance;
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => di.init();

@module
abstract class RegisterModule {
  @lazySingleton
  LocalAudioService get recorder => LocalAudioService();

  @lazySingleton
  AudioPlayService get player => AudioPlayService();
}
