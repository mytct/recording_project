import 'package:app_test/data/models/audio_list_item_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDb {
  static const String _boxName = "audioBox";

  static Future<void> init() async {
    Hive.registerAdapter(AudioDataAdapter());
    await Hive.openBox<AudioData>(_boxName);
  }

  static Future<void> addAudio(AudioData audio) async {
    final box = Hive.box<AudioData>(_boxName);
    await box.add(audio);
  }

  static List<AudioData> getAllAudio() {
    final box = Hive.box<AudioData>(_boxName);
    return box.values.toList();
  }
}
