import 'dart:convert';
import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/dto/weather_detail_dto.dart';
import 'package:weather/domain/models/weather_detail_model.dart';
import 'package:weather/domain/models/weather_forecast_model.dart';

part 'weather_forecast_dto.g.dart';

@JsonSerializable()
class WeatherForecastDto extends WeatherForecastModel {
  @JsonKey(
    fromJson: weatherDetailFromJson,
    toJson: weatherDetailToJson,
  )
  final List<WeatherDetailDto>? data;

  WeatherForecastDto({
        super.city_name,
        super.country_code,
        this.data,
        super.lat,
        super.lon
      }) : super(data: data);

  factory WeatherForecastDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastDtoToJson(this);

  static List<WeatherDetailDto>? weatherDetailFromJson(List<dynamic> json) {
    return json.map((e) => WeatherDetailDto.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>>? weatherDetailToJson(List<WeatherDetailDto>? data) {
    return data?.map((e) => e.toJson()).toList();
  }
}
