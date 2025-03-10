import 'package:app_test/core/strings.dart';
import 'package:app_test/data/models/audio_list_item_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDb {
  static Future<void> init() async {
    Hive.registerAdapter(AudioDataAdapter());
    await Hive.openBox<AudioData>(localAudioStorage);
  }

  static Future<void> addAudio(AudioData audio) async {
    final box = Hive.box<AudioData>(localAudioStorage);
    await box.add(audio);
  }

  static List<AudioData> getAllAudio() {
    final box = Hive.box<AudioData>(localAudioStorage);
    return box.values.toList();
  }
}
