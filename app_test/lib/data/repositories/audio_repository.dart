import 'package:app_test/core/strings.dart';
import 'package:app_test/data/models/audio_list_item_data.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class AudioRepository {
  List<AudioData> getRecordings();
}

@injectable
class AudioRepositoryImpl implements AudioRepository {
  final _audioBox = Hive.box<AudioData>(localAudioStorage);

  @override
  List<AudioData> getRecordings() {
    return _audioBox.values.toList();
  }
}
