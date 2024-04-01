// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastDto _$WeatherForecastDtoFromJson(Map<String, dynamic> json) =>
    WeatherForecastDto(
      city_name: json['city_name'] as String?,
      country_code: json['country_code'] as String?,
      data: WeatherForecastDto.weatherDetailFromJson(json['data'] as List),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherForecastDtoToJson(WeatherForecastDto instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'city_name': instance.city_name,
      'country_code': instance.country_code,
      'data': WeatherForecastDto.weatherDetailToJson(instance.data),
    };
