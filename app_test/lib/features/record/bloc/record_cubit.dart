import 'package:app_core/bloc/core_action.dart';
import 'package:app_core/bloc/core_cubit.dart';
import 'package:app_core/bloc/core_state.dart';
import 'package:app_core/model/core_message_resource.dart';
import 'package:app_test/core/di/di.dart';
import 'package:app_test/core/services/local_audio_services.dart';
import 'package:app_test/features/record/views/record_model_ui.dart';
import 'package:injectable/injectable.dart';

abstract interface class RecordCubitProtocol {
  void record();
}

@injectable
class RecordCubit extends CoreCubit<RecordModelUI>
    implements RecordCubitProtocol {
  RecordCubit() : super(const CoreState.init());
  final LocalAudioService recorder = di();

  @override
  void record() async {
    try {
      if (!recorder.isRecording) {
        final result = await recorder.startRecording((amplitude) {
          final List<double> moreDecibels = state.data?.decibels ?? [];
          moreDecibels.add(amplitude);
          if (moreDecibels.length > 50) {
            moreDecibels.removeAt(0); // Remove the oldest value
          }
          emitUI(
            data: state.data?.copyWith(
              decibels: moreDecibels,
            ),
          );
        });
        if (!result) {
          emitUI(
              data: state.data?.copyWith(isRecording: false, decibels: []),
              action: ToastAction.error(const CoreMessageErrorResource(
                  message: "something went wrong")));
          return;
        }
        emitUI(
            data: const RecordModelUI(isRecording: true),
            action: ToastAction.success(
                const CoreMessageErrorResource(message: "Recording...")));
        return;
      }
      await recorder.stopRecording();
      emitUI(
          data: state.data?.copyWith(isRecording: false, decibels: []),
          action: ToastAction.success(
              const CoreMessageErrorResource(message: "Record success")));
    } catch (ex) {
      emitUI(
          data: state.data?.copyWith(isRecording: false, decibels: []),
          action: ToastAction.error(
              CoreMessageErrorResource(message: "error ${ex.toString()}")));
    }
  }
}
