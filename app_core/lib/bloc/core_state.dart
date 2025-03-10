import 'package:equatable/equatable.dart';
import 'package:wismobile_core/bloc/wis_action.dart';
import 'package:wismobile_core/model/wis_message_resource.dart';

class CoreState<D> extends Equatable {
  final bool isLoading;
  final CoreMessageErrorResource? error;
  final D? data;
  final CoreAction? action;
  final CoreStateBehaviour behaviour;

  const CoreState({
    required this.isLoading,
    required this.data,
    required this.action,
    required this.error,
    required this.behaviour,
  });

  const CoreState.init({
    this.isLoading = true,
    this.data,
    this.action,
    this.error,
    this.behaviour = CoreStateBehaviour.ui,
  });

  CoreState<D> copyWith({
    bool? isLoading,
    CoreMessageErrorResource? error,
    D? data,
    CoreAction? action,
    CoreStateBehaviour? behaviour,
    bool? resetError,
  }) {
    return CoreState(
      isLoading: isLoading ?? this.isLoading,
      error: resetError == true ? null : error ?? this.error,
      data: data ?? this.data,
      action: action,
      // action only happens once so will not copy
      behaviour: behaviour ?? this.behaviour,
    );
  }

  @override
  List<Object?> get props => [isLoading, data, action, error, behaviour];
}
