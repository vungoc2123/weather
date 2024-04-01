class WeatherDetailModel{
  String? timestamp_local;
  Map<String, dynamic>? weather;
  double? app_temp;
  double? wind_spd;
  double? uv;
  double? rh;
  double? temp;

  WeatherDetailModel(
      {this.timestamp_local,
        this.weather,
        this.app_temp,
        this.wind_spd,
        this.uv,
        this.rh,
        this.temp});
}