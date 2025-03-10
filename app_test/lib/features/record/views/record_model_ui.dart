class RecordModelUI {
  final bool? isRecording;
  final List<double>? decibels;

  const RecordModelUI({this.isRecording, this.decibels});

  RecordModelUI copyWith({bool? isRecording, List<double>? decibels}) =>
      RecordModelUI(
          isRecording: isRecording ?? this.isRecording,
          decibels: decibels ?? this.decibels);
}
