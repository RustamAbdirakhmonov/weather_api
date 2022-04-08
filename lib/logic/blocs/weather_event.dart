part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class LoadApiEvent extends WeatherEvent {
  String location;
  LoadApiEvent({required this.location}):assert(location!=null);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class LoadFutureEvent extends WeatherEvent{
  String location;
  int index;
  LoadFutureEvent({required this.index,required this.location}):assert(index!=null,);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class NoInternetEvent extends WeatherEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class SearchEvent extends WeatherEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}