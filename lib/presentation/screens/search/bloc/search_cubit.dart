import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather/di.dart';
import 'package:weather/domain/models/location_model.dart';
import 'package:weather/domain/models/weather_model.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/presentation/screens/search/bloc/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final _weatherRepository = getIt<WeatherRepository>();

  SearchCubit() : super(SearchState());

  Future<void> fetchData(LocationModel locationModel, Marker marker, LatLng latlng) async {
    if (state.isShow == true) {
      emit(state.copyWith(isShow: false));
    }
   else{
      final responseCurrent =
          await _weatherRepository.getWeatherCurrent(locationModel);
      if (responseCurrent.isRight) {
        WeatherModel weatherModel = responseCurrent.right;
        emit(state.copyWith(weatherModel: weatherModel, isShow: true, marker: marker, latlng: latlng));
      }
    }
  }
}
