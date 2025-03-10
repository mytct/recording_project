import 'dart:convert';

import 'package:flutter_logs/flutter_logs.dart';
import 'package:app_core/config/init_protocol.dart';

abstract interface class LogsConfigProtocols implements InitProtocols {
  void log(
    String tag,
  ) {}
}

enum LogType { info, error }

mixin class LogsConfig implements LogsConfigProtocols {
  @override
  String tag = 'LogsConfig';

  @override
  Future<void> init() async {
    await FlutterLogs.initLogs(
        logLevelsEnabled: [
          LogLevel.INFO,
          LogLevel.WARNING,
          LogLevel.ERROR,
          LogLevel.SEVERE
        ],
        timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
        directoryStructure: DirectoryStructure.FOR_DATE,
        // logTypesEnabled: [_myLogFileName],
        logFileExtension: LogFileExtension.LOG,
        logsWriteDirectoryName: "WisLogs",
        logsExportDirectoryName: "WisLogs/Exported",
        debugFileOperations: true,
        isDebuggable: true,
        enabled: true);
  }

  @override
  void log(
    String tag, [
    dynamic data,
    subTag = '',
    LogType type = LogType.info,
  ]) {
    switch (type) {
      case LogType.error:
        FlutterLogs.logError(tag, '$subTag', logJson(data));
        break;
      default:
        FlutterLogs.logInfo(tag, '$subTag', logJson(data));
        break;
    }
  }

  String logJson(dynamic jsonData) => jsonEncode(jsonData);
}
