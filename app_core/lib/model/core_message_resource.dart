import 'package:equatable/equatable.dart';
import 'package:app_core/model/core_common_error.dart';
import 'package:app_core/utils/core_lokalise_id.dart';

class CoreMessageErrorResource extends Equatable {
  final String? message;
  final CoreLokaliseIds? id;

  const CoreMessageErrorResource({this.message, this.id});

  String getMessage(context, [String extra = '']) {
    if (message != null) return message ?? "";
    return context.toLokaliseString(extra) ?? "";
  }

  CoreCommonErrorType getErrorType() {
    if (id == CoreLokaliseIds.noInternetMessage) {
      return CoreCommonErrorType.noNetwork;
    }
    return CoreCommonErrorType.serverError;
  }

  String? getOptionalMessage(context) {
    if (message != null) return message;
    return context.toLokaliseString();
  }

  @override
  List<Object?> get props => [message, id];
}
