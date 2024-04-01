import 'package:equatable/equatable.dart';
import 'package:weather/core/enums/load_status.dart';
import 'package:weather/domain/models/weather_forecast_model.dart';
import 'package:weather/domain/models/weather_model.dart';

class HomeState extends Equatable {
  LoadStatus? status;
  WeatherModel? currentWeather;
  WeatherForecastModel? todayForecast;
  WeatherForecastModel? fiveDayForecast;

  HomeState({this.status, this.currentWeather, this.todayForecast, this.fiveDayForecast});

  HomeState copyWith({
    LoadStatus? status,
    WeatherModel? currentWeather,
    WeatherForecastModel? todayForecast,
    WeatherForecastModel? fiveDayForecast,
  }) {
    return HomeState(
      status : status ?? this.status,
      currentWeather: currentWeather ?? this.currentWeather,
      todayForecast: todayForecast ?? this.todayForecast,
      fiveDayForecast: fiveDayForecast ?? this.fiveDayForecast,
    );
  }

  @override
  List<Object?> get props => [status, currentWeather, todayForecast, fiveDayForecast];
}
