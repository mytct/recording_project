import 'package:app_core/bloc/core_usecase.dart';
import 'package:app_core/data/core_request.dart';
import 'package:app_test/data/models/audio_list_item_data.dart';

class RecordingListUsecase
    implements CoreUseCasesProtocols<NoParams?, List<AudioData>> {
  @override
  Future<List<AudioData>> invoke(NoParams? params) async {
    return [];
  }
}
