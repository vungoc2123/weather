class WeatherModel {
  String? city_name;
  String? country_code;
  double? app_temp;
  double? wind_spd;
  Map<String, dynamic>? weather;
  String? datetime;
  double? uv;
  double? rh;
  double? lat;
  double? lon;

  WeatherModel(
      {this.city_name,
      this.country_code,
      this.app_temp,
      this.wind_spd,
      this.datetime,
      this.weather,
      this.rh,
      this.lat,
      this.lon,
      this.uv});
}
