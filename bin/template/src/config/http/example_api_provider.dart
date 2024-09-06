import 'package:dio/dio.dart';
import 'package:{PROJECT_NAME}/src/config/env/env.dart';
import 'package:{PROJECT_NAME}/src/config/http/app_interceptors.dart';

class ExampleAPIProvider {
  final String _baseApiUrl = Env.api;

  late Dio dio;

  ExampleAPIProvider() {
    dio = Dio(BaseOptions(baseUrl: _baseApiUrl));
    dio.interceptors.add(AppInterceptors());
  }
}
