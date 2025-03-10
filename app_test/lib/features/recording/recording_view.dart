import 'package:app_core/ui/core_stateful.dart';
import 'package:flutter/material.dart';

class RecordingView extends CoreView {
  const RecordingView({super.key});
  @override
  State<RecordingView> createState() => RecordingViewState();
}

class RecordingViewState extends CoreViewState<RecordingView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text(
        "Header Container",
        style: TextStyle(color: Colors.white, fontSize: 20),
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
