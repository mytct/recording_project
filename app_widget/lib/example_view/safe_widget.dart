library wismobile_widget;

import 'package:flutter/material.dart';
import 'package:app_core/ui/core_stateful.dart';

class SafeAreaWidget extends CoreStateful {
  const SafeAreaWidget({
    super.key,
    required this.childView,
  });

  final Widget? childView;

  @override
  State<SafeAreaWidget> createState() => SafeAreaWidgetState();
}

class SafeAreaWidgetState extends CoreStatefulState<SafeAreaWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: widget.childView ?? const SizedBox());
  }

  @override
  void clear() {}

  @override
  void initData() {}

  @override
  void requestApi() {}
}
