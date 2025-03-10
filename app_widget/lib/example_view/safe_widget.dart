library wismobile_widget;

import 'package:flutter/material.dart';
import 'package:app_core/ui/core_stateful.dart';

class SafeAreaWidget extends CoreView {
  const SafeAreaWidget({
    super.key,
    required this.childView,
  });

  final Widget? childView;

  @override
  State<SafeAreaWidget> createState() => SafeAreaWidgetState();
}

class SafeAreaWidgetState extends CoreViewState<SafeAreaWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: (widget.childView != null)
            ? Container(
                child: widget.childView,
                color: Colors.white,
              )
            : const SizedBox());
  }

  @override
  void clear() {}

  @override
  void initData() {}

  @override
  void requestApi() {}
}
