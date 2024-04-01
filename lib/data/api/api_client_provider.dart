import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:weather/data/api/api_client.dart';
import 'package:weather/di.dart';

class ApiClientProvider {
  static void init({bool forceInit = false}) {
    final dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.interceptors.addAll([
      //ApiInterceptors(),
    ]);
    // By pass certificate
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient(context: SecurityContext(withTrustedRoots: false));
        client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
        return client;
      },
    );
    dio.options.headers = {
      'X-RapidAPI-Key': 'ead4e93725msh0bb0eabba77163ep1590c9jsnfdaa671af6db',
      'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com'
    };

    getIt.registerLazySingleton<ApiClient>(() => ApiClient(dio, baseUrl: 'https://weatherbit-v1-mashape.p.rapidapi.com'));
  }
}
