import 'package:app_core/ui/core_stateful.dart';
import 'package:flutter/material.dart';

class AudioListView extends CoreView {
  const AudioListView({super.key});
  @override
  State<AudioListView> createState() => AudioListViewState();
}

class AudioListViewState extends CoreViewState<AudioListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10, // Replace with your list length
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.audio_file_rounded),
            title: Text("Item ${index + 1}"),
            subtitle: Text("Subtitle ${index + 1}"),
            trailing: const Icon(Icons.play_circle_outline_rounded),
          );
        },
      ),
    );
  }

  @override
  void clear() {}

  @override
  void initData() {}

  @override
  void requestApi() {}
}
