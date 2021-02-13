import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequest extends WeatherEvent {
  final String city;
  final String lat;
  final String lon;

  const WeatherRequest({this.city = "", this.lat = "", this.lon = ""})
      : assert(city != null);

  @override
  List<Object> get props => [city];
}
