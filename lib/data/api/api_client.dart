import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather/data/dto/weather_dto.dart';
import 'package:weather/data/dto/weather_forecast_dto.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: '')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET('/current')
  Future<WeatherDto> getWeatherCurrent(
      {@Query('lon') double? lon, @Query('lat') double? lat});

  @GET('/forecast/3hourly')
  Future<WeatherForecastDto> getWeather5Day(
      {@Query('lon') double? lon, @Query('lat') double? lat});
}
