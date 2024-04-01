// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) => WeatherDto(
      city_name: json['city_name'] as String?,
      country_code: json['country_code'] as String?,
      datetime: json['datetime'] as String?,
      app_temp: (json['app_temp'] as num?)?.toDouble(),
      wind_spd: (json['wind_spd'] as num?)?.toDouble(),
      uv: (json['uv'] as num?)?.toDouble(),
      rh: (json['rh'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      weather: json['weather'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$WeatherDtoToJson(WeatherDto instance) =>
    <String, dynamic>{
      'city_name': instance.city_name,
      'country_code': instance.country_code,
      'app_temp': instance.app_temp,
      'wind_spd': instance.wind_spd,
      'weather': instance.weather,
      'datetime': instance.datetime,
      'uv': instance.uv,
      'rh': instance.rh,
      'lat': instance.lat,
      'lon': instance.lon,
    };
