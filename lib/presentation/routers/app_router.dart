import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather/presentation/routers/route_name.dart';
import 'package:weather/presentation/screens/home_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {

    final initialWidget = HomeScreen();
    Widget routeWidget = initialWidget;
    final arguments = routeSettings.arguments;

    switch (routeSettings.name) {
      case RouteName.root:
        break;
      default:
        routeWidget = initialWidget;
        break;
    }

    return MaterialPageRoute(
        builder: (_) => routeWidget, settings: routeSettings);
  }
}
