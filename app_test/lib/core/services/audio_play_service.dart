import 'package:audioplayers/audioplayers.dart';

class AudioPlayService {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playAudio(String filePath) async {
    await _player.play(DeviceFileSource(filePath));
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
