import 'dart:async';
import 'dart:io';

import 'package:app_core/config/logs_config.dart';
import 'package:app_test/core/strings.dart';
import 'package:app_test/data/models/audio_list_item_data.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:hive/hive.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalAudioService with LogsConfig {
  late final FlutterSoundRecorder _recorder;

  LocalAudioService() {
    _recorder = FlutterSoundRecorder();
    init(); // Ensure initialization
  }

  final _audioBox = Hive.box<AudioData>(localAudioStorage);

  bool isRecording = false;
  StreamSubscription? _recorderSubscription;
  final StreamController<double> _waveformController =
      StreamController<double>.broadcast();

  Future<void> init() async {
    await _recorder.openRecorder();
    await _recorder.setSubscriptionDuration(const Duration(milliseconds: 100));
  }

  Future<String> saveToDownloads() async {
    final directory = Directory('/storage/emulated/0/Download');
    final filePath =
        '${directory.path}/recording_${DateTime.now().millisecondsSinceEpoch}.aac';
    return filePath;
  }

  Future<void> startForegroundService() async {
    const androidConfig = FlutterBackgroundAndroidConfig(
      notificationTitle: "Recording in Background",
      notificationText: "Your app is recording audio",
      notificationImportance: AndroidNotificationImportance.normal,
      enableWifiLock: true,
    );

    await FlutterBackground.initialize(androidConfig: androidConfig);
    await FlutterBackground.enableBackgroundExecution();
  }

  Future<bool> startRecording(Function(double) callback) async {
    if (!(await Permission.microphone.request().isGranted)) {
      openAppSettings();
      return false;
    }

    if (!(await Permission.storage.request().isGranted)) {
      openAppSettings();
      return false;
    }

    if (!FlutterBackground.isBackgroundExecutionEnabled) {
      startForegroundService();
      return false;
    }

    String filePath = await saveToDownloads();

    _recorder.startRecorder(toFile: filePath, codec: Codec.aacADTS);
    isRecording = true;
    _recorderSubscription = _recorder.onProgress?.listen((event) {
      log('decibels', 'event= ${event.toString()}');
      double amplitude = event.decibels ?? 0;
      log('decibels', 'amplitude= ${amplitude}');
      callback(amplitude);
    });
    return true;
  }

  Future<bool> stopRecording() async {
    String? path = await _recorder.stopRecorder();
    if (path == null) return false;

    isRecording = false;
    _recorderSubscription?.cancel();

    _audioBox.add(AudioData(
        filePath: path,
        title: DateTime.now().microsecondsSinceEpoch.toString()));

    return true;
  }

  List<AudioData> getRecordedFiles() {
    return _audioBox.values.toList();
  }
}
