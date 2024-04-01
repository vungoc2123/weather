
import 'package:json_annotation/json_annotation.dart';
import 'package:weather/domain/models/weather_model.dart';

part 'weather_dto.g.dart';

@JsonSerializable()
class WeatherDto extends WeatherModel {
  WeatherDto({
    super.city_name,
    super.country_code,
    super.datetime,
    super.app_temp,
    super.wind_spd,
    super.uv,
    super.rh,
    super.lat,
    super.lon,
    super.weather
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);

  }
