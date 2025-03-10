import 'package:app_core/bloc/core_cubit.dart';
import 'package:app_test/features/audio_list/views/audio_list_ui.dart';

interface class AudioListCubitProtocol {}

class AudioListCubit extends CoreCubit<AudioListUi>
    implements AudioListCubitProtocol {
  AudioListCubit(super.initialState);
}
