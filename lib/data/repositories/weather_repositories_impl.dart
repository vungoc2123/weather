import 'package:either_dart/src/either.dart';
import 'package:weather/data/api/api_client.dart';
import 'package:weather/di.dart';
import 'package:weather/domain/models/location_model.dart';
import 'package:weather/domain/models/weather_forecast_model.dart';
import 'package:weather/domain/models/weather_model.dart';
import 'package:weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final api = getIt.get<ApiClient>();

  @override
  Future<Either<String, WeatherForecastModel>> getWeather5Day(
      LocationModel location) async {
    try {
      final response = await api.getWeather5Day(
          lat: location.latitude, lon: location.longitude);
      return Right(response);
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, WeatherModel>> getWeatherCurrent(
      LocationModel location) async {
    try {
      final response = await api.getWeatherCurrent(
          lat: location.latitude, lon: location.longitude);
      return Right(response);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
