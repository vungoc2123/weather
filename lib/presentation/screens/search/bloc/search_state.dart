import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather/domain/models/weather_model.dart';

class SearchState extends Equatable {
  WeatherModel? weatherModel;
  bool? isShow;
  Marker? marker;
  LatLng? latlng;

  SearchState({this.weatherModel, this.isShow, this.marker, this.latlng});

  SearchState copyWith(
      {WeatherModel? weatherModel,
      bool? isShow,
      Marker? marker,
      LatLng? latlng}) {
    return SearchState(
        weatherModel: weatherModel ?? this.weatherModel,
        isShow: isShow ?? this.isShow,
        marker: marker ?? this.marker,
        latlng: latlng ?? this.latlng);
  }

  @override
  List<Object?> get props => [isShow, weatherModel, marker, latlng];
}
