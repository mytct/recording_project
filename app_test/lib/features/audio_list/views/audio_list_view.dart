import 'package:app_core/bloc/core_consumer.dart';
import 'package:app_core/bloc/core_state.dart';
import 'package:app_core/ui/core_stateful.dart';
import 'package:app_test/features/audio_list/bloc/audio_list_action.dart';
import 'package:app_test/features/audio_list/bloc/audio_list_cubit.dart';
import 'package:app_test/features/audio_list/views/audio_list_model_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_test/core/di/di.dart';

class AudioListView extends CoreView {
  const AudioListView({super.key});
  @override
  State<AudioListView> createState() => AudioListViewState();
}

class AudioListViewState extends CoreViewState<AudioListView> {
  final AudioListCubit cubit = di();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: CoreBlocConsumer<AudioListCubit, CoreState<AudioListModelUI>,
          AudioListCubitAction>(
        actionListener: (context, state, action) {},
        builder: (context, state) {
          final data = state.data?.list ?? [];
          final indexPlaying = state.data?.indexPlaying ?? -1;
          return Expanded(
            child: RefreshIndicator(
              onRefresh: cubit.loadList,
              child: (data.isNotEmpty)
                  ? ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            if (indexPlaying != -1) return;
                            cubit.playRecord(data[index].filePath, index);
                          },
                          leading: const Icon(Icons.audio_file_rounded),
                          title: Text("${data[index].title}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(
                                  Icons.upload_file_outlined,
                                  color: (!data[index].isSynced)
                                      ? Colors.black
                                      : Colors.blue,
                                ),
                              ),
                              (indexPlaying == index)
                                  ? const Icon(
                                      Icons.pause_circle_outline_rounded)
                                  : const Icon(
                                      Icons.play_circle_outline_rounded),
                            ],
                          ),
                        );
                      },
                    )
                  : const SizedBox.expand(
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 150),
                            child: Text('Empty'),
                          ),
                        ),
                      ),
                    ),
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
