import 'package:app_core/bloc/core_consumer.dart';
import 'package:app_core/bloc/core_state.dart';
import 'package:app_core/ui/core_stateful.dart';
import 'package:app_test/core/di/di.dart';
import 'package:app_test/features/record/bloc/record_action.dart';
import 'package:app_test/features/record/bloc/record_cubit.dart';
import 'package:app_test/features/record/views/record_model_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordView extends CoreView {
  const RecordView({super.key});
  @override
  State<RecordView> createState() => RecordViewState();
}

class RecordViewState extends CoreViewState<RecordView> {
  final RecordCubit cubit = di();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: CoreBlocConsumer<RecordCubit, CoreState<RecordModelUI>,
          RecordCubitAction>(
        actionListener: (context, state, action) {},
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: 150,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text(
              "Header Container",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        },
      ),
    );
  }

  @override
  void clear() {}

  @override
  void initData() {}

  @override
  void requestApi() {}
}
