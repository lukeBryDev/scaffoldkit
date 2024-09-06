import 'dart:developer';

import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    List noRequiresAuthentication = [];

    bool requiresToken = !noRequiresAuthentication.contains(options.path);

    if (requiresToken) {
      // final res = await sl<GetSessionUseCase>().call(NoParams());
      // var auth = res.fold<AuthEntity?>((l) => null, (r) => r);
      final String? token = ''; //TODO: implement
      if (token != null) {
        // if (auth != null && auth.token != null) {
        options.headers
            .addAll({"Authorization": "Bearer ${token}"}); //${auth.token}
      }
    }

    super.onRequest(options, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    String errorDescription = "";
    switch (err.type) {
      case DioExceptionType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioExceptionType.unknown:
        errorDescription =
            "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        if (err.response?.statusCode == 401) {
          //await sl<LogoutUseCase>().call(NoParams());
          //   Get.offAndToNamed(LoginPage.routeName);
        }
        //   if (err.response?.data.containsKey("message") &&
        //       err.response?.data["message"].contains("jwt")) {
        //     await sl<ClearSessionUseCase>().call(NoParams());
        //
        //     Get.offAndToNamed(LoginPage.routeName);
        //   }
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        break;
    }
    log("errorDescription:\t$errorDescription");
    err.copyWith(error: errorDescription);
    return super.onError(err, handler);
  }
}
