import 'package:app_core/ui/core_stateless.dart';
import 'package:app_test/features/recording/recording_view.dart';
import 'package:app_test/features/recording_list/recording_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class HomeView extends CoreStateless {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        RecordingView(),
        RecordingListView(),
      ],
    );
  }
}
