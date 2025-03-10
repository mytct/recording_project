import 'package:app_test/data/models/audio_list_item_data.dart';

class AudioListModelUI {
  final List<AudioData>? list;
  final int? indexPlaying;

//NOTE: -1 mean not playing any items
  const AudioListModelUI({this.list, this.indexPlaying = -1});

  AudioListModelUI copyWith({
    List<AudioData>? list,
    int? indexPlaying,
  }) =>
      AudioListModelUI(
        list: list ?? this.list,
        indexPlaying: indexPlaying ?? this.indexPlaying,
      );
}
