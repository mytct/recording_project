import 'package:flutter/widgets.dart';

enum CoreLokaliseIds {
  serverError,
  noInternetMessage,
  otherError;
}

extension CoreLokaliseIdsExt on BuildContext {
  /** 
   * update lokalise values in future here
   */
  String toLokaliseString([String extra = '']) {
    switch (this) {
      case CoreLokaliseIds.serverError:
        return 'server_err';
      case CoreLokaliseIds.noInternetMessage:
        return 'server_err';
      case CoreLokaliseIds.otherError:
        return 'something_went_wrong';
      default:
        return '';
    }
  }
}
