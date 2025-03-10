import 'package:app_core/bloc/core_action.dart';
import 'package:app_core/bloc/core_cubit.dart';
import 'package:app_core/bloc/core_state.dart';
import 'package:app_core/config/di.dart';
import 'package:app_core/model/core_message_resource.dart';
import 'package:app_test/core/services/audio_play_service.dart';
import 'package:app_test/data/repositories/audio_repository.dart';
import 'package:app_test/features/audio_list/views/audio_list_model_ui.dart';
import 'package:injectable/injectable.dart';

abstract interface class AudioListCubitProtocol {
  Future<void> loadList();
  void playRecord(String filePath, int index);
}

@injectable
class AudioListCubit extends CoreCubit<AudioListModelUI>
    implements AudioListCubitProtocol {
  AudioListCubit() : super(const CoreState.init());
  final AudioRepositoryImpl _repo = di();
  final AudioPlayService _player = di();

  @override
  Future<void> loadList() async {
    try {
      emitUI(data: AudioListModelUI(list: _repo.getRecordings()));
    } catch (ex) {
      emitAction(ToastAction.error(
          CoreMessageErrorResource(message: "error ${ex.toString()}")));
    }
  }

  @override
  void playRecord(String filePath, int index) {
    try {
      if (state.data?.indexPlaying != -1) return;
      if (filePath.isEmpty) return;
      emitUI(
          data: state.data?.copyWith(indexPlaying: index),
          action: ToastAction.success(
              const CoreMessageErrorResource(message: "Playing...")));

      _player.playAudio(filePath, finish: () {
        //reset after playing finish
        emitUI(
            data: state.data?.copyWith(indexPlaying: -1),
            action: ToastAction.success(
                const CoreMessageErrorResource(message: "Play finished")));
      });
    } catch (ex) {
      emitAction(ToastAction.error(
          CoreMessageErrorResource(message: "error ${ex.toString()}")));
    }
  }
}
