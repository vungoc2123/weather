import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/presentation/routers/route_name.dart';
import 'package:weather/presentation/screens/home/bloc/home_cubit.dart';
import 'package:weather/presentation/screens/home/home_screen.dart';
import 'package:weather/presentation/screens/search/bloc/search_cubit.dart';
import 'package:weather/presentation/screens/search/search_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    final initialWidget = BlocProvider(
        create: (BuildContext context) => HomeCubit(),
        child: HomeScreen()
    );
    Widget routeWidget = initialWidget;
    final arguments = routeSettings.arguments;

    switch (routeSettings.name) {
      case RouteName.root:
        break;
      case RouteName.home:
        routeWidget = BlocProvider(
            create: (BuildContext context) => HomeCubit(),
            child: HomeScreen()
        );
        break;
      case RouteName.search:
        routeWidget = BlocProvider(
            create: (BuildContext context) => SearchCubit(),
            child: SearchScreen()
        );
        break;
      default:
        routeWidget = initialWidget;
        break;
    }

    return MaterialPageRoute(
        builder: (_) => routeWidget, settings: routeSettings);
  }
}
