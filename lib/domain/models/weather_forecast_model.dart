import 'package:weather/domain/models/weather_detail_model.dart';

class WeatherForecastModel {
  double? lat;
  double? lon;
  String? city_name;
  String? country_code;
  List<WeatherDetailModel>? data;

  WeatherForecastModel(
      {this.lat, this.lon, this.city_name, this.country_code, this.data});
}
