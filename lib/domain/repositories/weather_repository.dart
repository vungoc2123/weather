import 'package:either_dart/either.dart';
import 'package:weather/domain/models/location_model.dart';
import 'package:weather/domain/models/weather_forecast_model.dart';
import 'package:weather/domain/models/weather_model.dart';

abstract class WeatherRepository{
  Future<Either<String, WeatherModel>> getWeatherCurrent(LocationModel location);
  Future<Either<String, WeatherForecastModel>> getWeather5Day(LocationModel location);
}