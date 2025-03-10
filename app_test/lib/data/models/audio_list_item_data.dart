import 'package:hive/hive.dart';

part 'audio_list_item_data.g.dart';

@HiveType(typeId: 0)
class AudioData extends HiveObject {
  @HiveField(0)
  String filePath;

  @HiveField(1)
  String title;

  @HiveField(2)
  bool isSynced;

  AudioData({
    required this.filePath,
    required this.title,
    this.isSynced = false,
  });
}
