import 'package:app_core/bloc/core_cubit.dart';
import 'package:app_core/bloc/core_state.dart';
import 'package:app_test/features/record/views/record_model_ui.dart';
import 'package:injectable/injectable.dart';

interface class RecordCubitProtocol {}

@injectable
class RecordCubit extends CoreCubit<RecordModelUI>
    implements RecordCubitProtocol {
  RecordCubit() : super(const CoreState.init());
}
