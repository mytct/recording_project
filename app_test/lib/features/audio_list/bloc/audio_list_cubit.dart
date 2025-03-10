import 'package:app_core/bloc/core_cubit.dart';
import 'package:app_core/bloc/core_state.dart';
import 'package:app_test/features/audio_list/views/audio_list_ui.dart';
import 'package:injectable/injectable.dart';

interface class AudioListCubitProtocol {}

@injectable
class AudioListCubit extends CoreCubit<AudioListUi>
    implements AudioListCubitProtocol {
  AudioListCubit() : super(const CoreState.init());
}
