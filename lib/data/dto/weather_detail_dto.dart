import 'package:json_annotation/json_annotation.dart';
import 'package:weather/domain/models/weather_detail_model.dart';
part 'weather_detail_dto.g.dart';
@JsonSerializable()
class WeatherDetailDto extends WeatherDetailModel{
  WeatherDetailDto({
    super.app_temp,
    super.timestamp_local,
    super.rh,
    super.temp,
    super.uv,
    super.weather,
    super.wind_spd,
});

  factory WeatherDetailDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDetailDtoToJson(this);
}