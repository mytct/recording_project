import 'package:app_core/bloc/core_consumer.dart';
import 'package:app_core/bloc/core_state.dart';
import 'package:app_core/ui/core_stateful.dart';
import 'package:app_test/core/di/di.dart';
import 'package:app_test/core/utils/custom_wave.dart';
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
          final isRecording = state.data?.isRecording ?? false;
          final List<double> decibels = state.data?.decibels ?? [];
          log('decibels', '${decibels}');
          return Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 150,
              color: Colors.grey,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    height: 20,
                    child: CustomPaint(
                      painter: WaveformPainter(decibels),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.record();
                    },
                    child: Text(
                      isRecording ? "Stop" : "Start",
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ));
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
