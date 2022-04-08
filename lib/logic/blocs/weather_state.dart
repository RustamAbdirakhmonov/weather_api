part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherLoadingState extends WeatherState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class WeatherLoadedState extends WeatherState{
  CurrentRegion currentRegion;
  CurrentWeather currentWeather;
  List<CurrentWeather> list;
  WeatherLoadedState({required this.currentRegion,required this.currentWeather,required this.list});



  @override
  // TODO: implement props
  List<Object?> get props => [currentWeather,currentRegion,list];



}
class WeatherNoInternetState extends WeatherState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class RouteNextPage extends WeatherState{

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}