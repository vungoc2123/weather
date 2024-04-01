// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDetailDto _$WeatherDetailDtoFromJson(Map<String, dynamic> json) =>
    WeatherDetailDto(
      app_temp: (json['app_temp'] as num?)?.toDouble(),
      timestamp_local: json['timestamp_local'] as String?,
      rh: (json['rh'] as num?)?.toDouble(),
      temp: (json['temp'] as num?)?.toDouble(),
      uv: (json['uv'] as num?)?.toDouble(),
      weather: json['weather'] as Map<String, dynamic>?,
      wind_spd: (json['wind_spd'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherDetailDtoToJson(WeatherDetailDto instance) =>
    <String, dynamic>{
      'timestamp_local': instance.timestamp_local,
      'weather': instance.weather,
      'app_temp': instance.app_temp,
      'wind_spd': instance.wind_spd,
      'uv': instance.uv,
      'rh': instance.rh,
      'temp': instance.temp,
    };
