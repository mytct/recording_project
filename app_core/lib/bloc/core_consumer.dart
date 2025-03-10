import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_core/bloc/core_action.dart';
import 'package:app_core/bloc/core_state.dart';

typedef BlocWidgetListener<S, A> =
    void Function(BuildContext context, S state, A action);

class CoreBlocConsumer<B extends StateStreamable<S>, S, A extends CoreAction>
    extends BlocConsumer<B, S> {
  final BlocWidgetListener<S, A> actionListener;

  CoreBlocConsumer({
    super.key,
    required this.actionListener,
    required super.builder,
  }) : super(
         listener: (BuildContext context, S state) {
           if (state is CoreState) {
             final action = state.action;
             if (action is ToastAction) {
               // show common toast
             } else if (action is DialogAction) {
               // show dialog
             }
             if (action is A) {
               actionListener.call(context, state, action);
             }
           }
         },
         buildWhen: (previous, current) {
           if (current is CoreState) {
             return current.behaviour == CoreStateBehaviour.ui;
           }
           return true;
         },
       );
}
