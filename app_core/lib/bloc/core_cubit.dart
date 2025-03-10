import 'dart:async';

import 'package:app_core/bloc/core_action.dart';
import 'package:app_core/bloc/core_safe_cubit.dart';
import 'package:app_core/bloc/core_state.dart';
import 'package:app_core/config/logs_config.dart';
import 'package:app_core/model/core_message_resource.dart';

class CoreCubit<D> extends CoreSafeCubit<CoreState<D>> with LogsConfig {
  late List<StreamSubscription> disposeBag = List.empty(growable: true);

  CoreCubit(super.initialState);

  void emitUI({
    D? data,
    CoreAction? action,
    bool? isLoading,
    CoreMessageErrorResource? error,
    bool? resetError,
  }) {
    super.emit(
      state.copyWith(
        isLoading: isLoading,
        error: error,
        data: data,
        action: action,
        behaviour: CoreStateBehaviour.ui,
        resetError: resetError,
      ),
    );
  }

  void emitAction(CoreAction action) {
    super.emit(
      state.copyWith(action: action, behaviour: CoreStateBehaviour.action),
    );
  }

  @override
  Future<void> close() {
    for (var dispose in disposeBag) {
      dispose.cancel();
    }
    return super.close();
  }
}
