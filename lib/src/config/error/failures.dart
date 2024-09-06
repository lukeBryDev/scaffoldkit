import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({this.message = "Undefined error"});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  final String? message;
  final int? statusCode;
  final Map? data;
  final DioException? error;

  const ServerFailure({this.error, this.message, this.data, this.statusCode})
      : super(message: message);

  ServerFailure get extract {
    String? _message = '';
    int? _statusCode;
    Map? _data;
    _statusCode = error?.response?.statusCode;
    if (error?.response?.data is Map) {
      if (error?.response?.data.containsKey('mensaje')) {
        _message = error?.response?.data['mensaje'];
      } else if (error?.response?.data.containsKey('message')) {
        _message = error?.response?.data['message'];
      } else if (error?.response?.data.containsKey('agotado')) {
        _message = error?.response?.data['agotado'];
      } else if (error?.response?.data.containsKey('titulo')) {
        _message = error?.response?.data['titulo'];
      } else if (error?.response?.data.containsKey('error')) {
        _message = error?.response?.data['error'];
      } else {
        /// Unhandled message. Shows all object
        _message = error?.response?.data.toString();
      }
    } else if (error?.error is String) {
      _message = error?.error as String?;
    } else if (error?.response?.data is String) {
      _message = error?.response?.data;
    }

    /* switch (error?.response.runtimeType) {
      case Response:
        _message = error?.response?.statusMessage;
        log(error?.response?.statusMessage ?? '', name: 'message3');
        break;
      case String:
        _message = error?.response?.statusMessage;
        log(error?.response?.statusMessage ?? '', name: 'message4');
        break;
    } */

    switch (error?.error.runtimeType) {
      case Map:
        break;
      case String:
        // log(error?.error?.toString() ?? '', name: 'error');
        break;
    }

    if (error?.response?.data is String) {
      _data = {"data": error?.response?.data?.toString()};
    } else if (error?.response?.data is Map) {
      _data = error?.response?.data;
    } else {
      _data = {"data": error?.response?.data?.toString()};
    }

    String pattern = r'(\<\w*)((\s\/\>)|(.*\<\/\w*\>))';
    RegExp regExp = RegExp(pattern);

    if (regExp.hasMatch(_message ?? '')) {
      _message = 'Http status error [$_statusCode]';
    }

    log(error.toString(), name: 'error');
    log(_statusCode.toString(), name: 'statusCode');
    log(_message.toString(), name: 'message');
    log(jsonEncode(_data ?? {}), name: 'data');

    return ServerFailure(
      error: error,
      message: _statusCode != 500
          ? _message
          : 'Hay un problema con los datos, inténtalo nuevamente',
      data: _data,
      statusCode: _statusCode,
    );
  }
}

class ErrorFailure extends Failure {
  final String message;
  final int statusCode;
  final Map? data;
  final Error error;

  const ErrorFailure(
      {required this.error, this.message = '', this.data, this.statusCode = 0})
      : super(message: message);

  ErrorFailure get extract {
    String _message = error.toString();
    int _statusCode = 0;
    Map? _data;

    log(error.runtimeType.toString(), name: 'error');
    log(_statusCode.toString(), name: 'statusCode');
    log(_message.toString(), name: 'message');
    log(jsonEncode(_data ?? {}), name: 'data');

    Map<String, dynamic> properties = {
      "error": error.runtimeType.toString(),
      "status_code": _statusCode.toString(),
      "message": _message.toString(),
      "data": jsonEncode(_data ?? {})
    };
    properties.removeWhere((k, v) => v == null || v == "null");
    return ErrorFailure(
      error: error,
      message: _message,
      data: _data,
      statusCode: _statusCode,
    );
  }
}

class ExceptionFailure extends Failure {
  final String message;
  final int statusCode;
  final Map? data;
  final Exception error;

  const ExceptionFailure(
      {required this.error, this.message = '', this.data, this.statusCode = 0})
      : super(message: message);

  ExceptionFailure get extract {
    String _message = error.toString();
    int _statusCode = 0;
    Map? _data;

    log(error.runtimeType.toString(), name: 'error');
    log(_statusCode.toString(), name: 'statusCode');
    log(_message.toString(), name: 'message');
    log(jsonEncode(_data ?? {}), name: 'data');

    Map<String, dynamic> properties = {
      "error": error.runtimeType.toString(),
      "status_code": _statusCode.toString(),
      "message": _message.toString(),
      "data": jsonEncode(_data ?? {})
    };

    properties.removeWhere((k, v) => v == null || v == "null");

    return ExceptionFailure(
      error: error,
      message: _message,
      data: _data,
      statusCode: _statusCode,
    );
  }
}
