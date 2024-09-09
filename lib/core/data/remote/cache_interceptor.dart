import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheInterceptor extends Interceptor {
  final Duration cacheDuration;

  CacheInterceptor({this.cacheDuration = const Duration(hours: 1)});

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Check if the request method is GET
    if (options.method.toUpperCase() == 'GET') {
      // Generate a cache key including the path and query parameters
      final cacheKey = _generateCacheKey(options);

      // Get the cached data from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final cachedResponse = prefs.getString(cacheKey);
      final cacheTime = prefs.getInt('$cacheKey-time');

      if (cachedResponse != null && cacheTime != null) {
        final currentTime = DateTime.now().millisecondsSinceEpoch;
        if (currentTime - cacheTime < cacheDuration.inMilliseconds) {
          // Return the cached response
          final cachedData = json.decode(cachedResponse);
          handler.resolve(Response(
            requestOptions: options,
            data: cachedData,
            statusCode: 200,
          ));
          return;
        }
      }
    }

    // Continue with the network request
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // Cache the response data for GET requests
    if (response.requestOptions.method.toUpperCase() == 'GET') {
      final cacheKey = _generateCacheKey(response.requestOptions);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(cacheKey, json.encode(response.data));
      await prefs.setInt('$cacheKey-time', DateTime.now().millisecondsSinceEpoch);
    }

    handler.next(response);
  }

  String _generateCacheKey(RequestOptions options) {
    final path = options.path;
    final queryParameters = options.queryParameters.entries.map((e) => '${e.key}=${e.value}').join('&');
    return '$path?$queryParameters';
  }
}
