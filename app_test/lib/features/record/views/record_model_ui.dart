class RecordModelUI {
  final bool? isRecording;

  const RecordModelUI({this.isRecording});

  RecordModelUI copyWith({
    bool? isRecording,
  }) =>
      RecordModelUI(isRecording: isRecording ?? this.isRecording);
}
