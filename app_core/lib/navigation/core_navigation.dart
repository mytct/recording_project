import 'package:flutter/material.dart';

abstract class CoreNavigator {
  const CoreNavigator();

  int get currentBottomTab;

  void navigateToBottomTab(int index);

  Future<T?> push<T extends Object?>(String path, [Object? extra]);

  Future<T?> pushName<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  });

  void pop<T extends Object?>({
    T? result,
  });

  Future<void> dialog<T extends Object?>({
    required Widget Function(BuildContext) builder,
    bool barrierDismissible = true,
  });

  Future<T?> showModalBottomSheet<T extends Object?>(
    WidgetBuilder builder, {
    bool isScrollControlled = false,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
  });

  void showErrorSnackBar({required String title, required String content});
  void showSuccessSnackBar({required String title, required String content});
  void showToastMessage({required String title, required String content});
}
