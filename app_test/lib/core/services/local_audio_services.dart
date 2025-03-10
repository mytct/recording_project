import 'dart:async';

import 'package:app_test/core/strings.dart';
import 'package:app_test/data/models/audio_list_item_data.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalAudioService {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  final _audioBox = Hive.box<AudioData>(localAudioStorage);

  bool isRecording = false;
  StreamSubscription? _recorderSubscription;

  Future<void> init() async {
    await _recorder.openRecorder();
  }

  Future<void> startRecording() async {
    if (await Permission.microphone.request().isGranted) {
      if (!FlutterBackground.isBackgroundExecutionEnabled) {
        await FlutterBackground.enableBackgroundExecution();
      }

      final directory = await getApplicationDocumentsDirectory();
      final filePath =
          '${directory.path}/recording_${DateTime.now().millisecondsSinceEpoch}.aac';

      await _recorder.startRecorder(toFile: filePath);
      isRecording = true;

      _recorderSubscription = _recorder.onProgress!.listen((event) {});
    }
  }

  Future<void> stopRecording() async {
    String? path = await _recorder.stopRecorder();
    if (path == null) return;

    isRecording = false;
    _recorderSubscription?.cancel();

    _audioBox.add(AudioData(
        filePath: path,
        title: DateTime.now().microsecondsSinceEpoch.toString()));
  }

  List<AudioData> getRecordedFiles() {
    return _audioBox.values.toList();
  }
}
