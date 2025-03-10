import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CoreSafeCubit<State> extends Cubit<State> {
  CoreSafeCubit(super.initialState);

  @override
  void emit(State state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
