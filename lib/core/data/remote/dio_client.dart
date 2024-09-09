import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:mtiwa_familia/core/config/env.dart';
import 'package:mtiwa_familia/core/helpers/preferences/shared_preferences_service.dart';
import 'package:mtiwa_familia/locator.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  DioClient._();

  static Dio create() {
    final Dio dio = Dio();

    dio.options.baseUrl = Env.baseUrl;

    // ignore: deprecated_member_use
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    if (kDebugMode || kProfileMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          logPrint: (object) => debugPrint(object.toString()),
        ),
      );
    }

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final SharedPrefsService preferences = getIt<SharedPrefsService>();

        final Map<String, dynamic> authHeaders = {
          'User-Locale': preferences.get<String>("language_code") ?? 'fr',
          'Authorization':
              "Bearer ${preferences.get<String>('access_token') ?? ''}",
        };

        options.headers.addAll(authHeaders);

        return handler.next(options);
      },
    ));

    Map<String, dynamic> headers = {
      'X-Requested-With': 'XMLHttpRequest',
      'Accept': 'application/json',
      'Content-Type': 'application/json;charset=UTF-8',
    };

    dio.options.headers.addAll(headers);

    return dio;
  }
}
