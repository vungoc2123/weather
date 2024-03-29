import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather/data/api/api_client_provider.dart';
import 'package:weather/presentation/app.dart';
import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(); // init DI
  await EasyLocalization.ensureInitialized(); // init localization
  // await EnvConfigs.init();
  ApiClientProvider.init(); // init api client

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
    path: 'assets/translations',
    fallbackLocale: const Locale('vi', 'VN'),
    startLocale: const Locale('vi', 'VN'),
    child: const MyApp(),
  ));

}
