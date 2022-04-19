import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_api/data/data_repositories/connectivityService.dart';
import 'package:weather_api/data/data_repositories/weatherService.dart';

import '../../data/models/current_weather.dart';
import '../../data/models/location.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  ConnectivityService connectivityService;
  WeatherService weatherService;

  WeatherBloc({required this.connectivityService, required this.weatherService})
      : super(WeatherLoadingState()) {
    connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print("No Internet");
        add(NoInternetEvent());
      } else {

        print("Yes Internet");
        add(LoadApiEvent(location: 'Tashkent'));
      }
    });
    on<LoadApiEvent>((event, emit) async {
      emit(WeatherLoadingState());
      final currentLocation =
          await weatherService.getCurrentLocation(event.location);
      final currentWeather = await weatherService.getCurrentWeather(event.location);
      final futureList= await weatherService.getFutureWeather(event.location, 8,);
      emit(WeatherLoadedState(
          currentRegion: currentLocation, currentWeather: currentWeather,list: futureList));

    });
    on<LoadFutureEvent>((event,emit) async{
      emit(WeatherLoadingState());
      final currentLocation =
      await weatherService.getCurrentLocation(event.location);
      final futureList= await weatherService.getFutureWeather(event.location, 8,);
       emit(WeatherLoadedState(currentRegion: currentLocation, currentWeather: futureList[event.index] , list:futureList ));

    });
    on<NoInternetEvent>((event, emit) {
      emit(WeatherNoInternetState());
    });
    on<SearchEvent> ((event,emit){
      emit(RouteNextPage());
    });
  }

}
