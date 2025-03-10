import 'package:app_core/model/core_message_resource.dart';

enum CoreStateBehaviour { ui, action }

abstract class CoreAction {}

enum CHToastType { success, failed }

class ToastAction extends CoreAction {
  final CoreMessageErrorResource message;
  final CHToastType type;
  final Duration? duration;

  ToastAction.error(this.message, {this.duration}) : type = CHToastType.failed;

  ToastAction.success(this.message, {this.duration})
    : type = CHToastType.success;
}

class DialogAction extends CoreAction {
  final CoreMessageErrorResource? title;
  final CoreMessageErrorResource message;
  final CoreMessageErrorResource? primaryAction;

  DialogAction({this.title, required this.message, this.primaryAction});
}
