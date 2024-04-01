import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/data/repositories/weather_repositories_impl.dart';
import 'package:weather/di.config.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/presentation/screens/home/bloc/home_cubit.dart';
import 'package:weather/presentation/screens/search/bloc/search_cubit.dart';

final getIt = GetIt.instance;
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  getIt.init();
  //repository
  getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl());
  //bloc
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit());
  getIt.registerLazySingleton<SearchCubit>(() => SearchCubit());
}