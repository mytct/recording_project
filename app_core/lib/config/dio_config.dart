import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:app_core/config/di.dart';
import 'package:app_core/config/logs_config.dart';

abstract interface class DioConfigProtocols {
  Dio dio();
  Map<String, dynamic> registerHeaders();
}

@module
abstract class DioModule {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio();
    dio.options = BaseOptions(
      sendTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    return dio;
  }
}

@injectable
class DioConfig with LogsConfig implements DioConfigProtocols {
  final Dio _dio = di();

  @override
  String tag = 'DioConfig';

  @override
  Future<void> init() async {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers.addAll(registerHeaders());
          log(tag, 'Request Info: ${options.headers}', 'Request');
          handler.next(options); // Continue
        },
        onResponse: (response, handler) {
          log(tag, 'Response Info: ${response.toString()}', 'Response');
          handler.next(response); // Continue
        },
        onError: (error, handler) {
          log(tag, 'Error Info: ${error.toString()}', 'Error');
          handler.next(error); // Continue
        },
      ),
    );
    log(tag);
  }

  @override
  Dio dio() => _dio;

  @override
  Map<String, dynamic> registerHeaders() => {};
}
