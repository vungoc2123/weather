import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/enums/load_status.dart';
import 'package:weather/core/utils/time_utils.dart';
import 'package:weather/di.dart';
import 'package:weather/domain/models/location_model.dart';
import 'package:weather/domain/models/weather_detail_model.dart';
import 'package:weather/domain/models/weather_forecast_model.dart';
import 'package:weather/domain/models/weather_model.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/presentation/screens/home/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(status: LoadStatus.initial));
  final _weatherRepository = getIt<WeatherRepository>();

  Future<void> fetchData(LocationModel location) async {
    WeatherModel currentWeather = WeatherModel();
    WeatherForecastModel? todayForecast = WeatherForecastModel();
    WeatherForecastModel fiveDayForecast = WeatherForecastModel();
    try {
      final responseCurrent = await _weatherRepository.getWeatherCurrent(LocationModel(latitude: location.latitude, longitude: location.longitude));
      if (responseCurrent.isRight) currentWeather = responseCurrent.right;

      final responseForecast = await _weatherRepository.getWeather5Day(
          LocationModel(
              latitude: location.latitude, longitude: location.longitude));
      if (responseForecast.isRight) {

        //today
        WeatherForecastModel todayForecastModel = WeatherForecastModel(
          lon: responseForecast.right.lon,
          lat: responseForecast.right.lat,
          city_name: responseForecast.right.city_name,
          country_code: responseForecast.right.country_code,
          data: responseForecast.right.data,
        );
        todayForecast = todayForecastModel;
        todayForecast.data = List.from(todayForecast.data!.take(5));

        //5 day
        WeatherForecastModel fiveForecastModel = WeatherForecastModel(
          lon: responseForecast.right.lon,
          lat: responseForecast.right.lat,
          city_name: responseForecast.right.city_name,
          country_code: responseForecast.right.country_code,
          data: responseForecast.right.data,
        );
        fiveDayForecast = fiveForecastModel;
        List<WeatherDetailModel>? list = [];
        String? day = '';
        if (fiveDayForecast.data != null) {
          for (WeatherDetailModel index in fiveDayForecast.data!) {
            if (TimeUtils().convertToDayOfWeek(index?.timestamp_local) != day) {
              day = TimeUtils().convertToDayOfWeek(index?.timestamp_local);
              list.add(index);
            }
          }
        }
        fiveDayForecast.data = list.sublist(1, list.length);
      }
    } catch (e) {
      emit(state.copyWith(status: LoadStatus.failure));
    }
    emit(state.copyWith(
        status: LoadStatus.success,
        currentWeather: currentWeather,
        todayForecast: todayForecast,
        fiveDayForecast: fiveDayForecast));
  }
}
