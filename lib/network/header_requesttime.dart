import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HeaderRequestTime {
  static Dio? _headerRequestTime;

  static Dio _createHeader() {
    var dio = Dio()
      ..options.contentType = Headers.jsonContentType
      ..options.headers[Headers.acceptHeader] =
          'application/json, text/plain, */*'
      ..options.connectTimeout = const Duration(seconds: 300);

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
          request: true, requestBody: true, responseBody: true, error: true));
    }

    return dio;
  }

  static Dio get instance {
    _headerRequestTime = _createHeader();
    return _headerRequestTime!;
  }
}
