import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';

class AudioPlayService {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playAudio(String filePath,
      {required VoidCallback finish}) async {
    await _player.play(DeviceFileSource(filePath));
    _player.onPlayerComplete.listen((event) {
      finish();
    });
  }

  Future<void> pauseAudio() async {
    await _player.pause();
  }

  Future<void> stopAudio() async {
    await _player.stop();
  }

  void dispose() {
    _player.dispose();
  }
}
