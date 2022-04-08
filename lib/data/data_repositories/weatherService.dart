import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_api/data/models/condition.dart';
import 'package:weather_api/data/models/current_weather.dart';
import 'package:weather_api/data/models/location.dart';

class WeatherLocationActivity {
  CurrentRegion currentRegion;

  WeatherLocationActivity({required this.currentRegion});
}

class CurrentWeatherActivity {
  CurrentWeather currentWeather;

  CurrentWeatherActivity({required this.currentWeather});
}

class WeatherService {

  Future<CurrentWeather> getCurrentWeather(String location,) async {

    final response = await get(Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=350be0371954439e94765932220204 &q=${location}&aqi=no"));
    Map<String, dynamic> data = json.decode(response.body);
    return CurrentWeather(

      last_updated: data["current"]["last_updated"],
      temp_c: data["current"]["temp_c"],
      condition: Condition(
          text: data["current"]["condition"]["text"],
          icon: data["current"]["condition"]["icon"]),
      is_day: data["current"]["is_day"],
      temp_f: data["current"]["temp_f"],
      gust_kph: data["current"]["gust_kph"],
      humidty: data["current"]["humidity"],
      pressure_mb: data["current"]["pressure_mb"],
      vis_km: data["current"]["vis_km"],
    );
  }

  Future<CurrentRegion> getCurrentLocation(String location) async {
    final response = await get(Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=350be0371954439e94765932220204 &q=${location}&aqi=no"));
    Map<String, dynamic> data = json.decode(response.body);
    return CurrentRegion(
        name: data["location"]["name"],
        region: data["location"]["region"],
        country: data["location"]["country"],
        lat: data["location"]["lat"],
        lon: data["location"]["lon"],
        localTime: data["location"]["localtime"],
        tz_id: data["location"]["tz_id"]);
  }

  Future<List<CurrentWeather>> getFutureWeather(
      String location, int days) async {
    List<CurrentWeather> list = [];
    final response = await get(Uri.parse(
        "http://api.weatherapi.com/v1/forecast.json?key=350be0371954439e94765932220204&q=${location}&days=8&aqi=no&alerts=no"));
    Map<String, dynamic> data = json.decode(response.body);
    for (int i = 0; i < 3; i++)
      list.add(CurrentWeather(

          last_updated: data["forecast"]["forecastday"][i]["date"],
          temp_c: data["forecast"]["forecastday"][i]["day"]["maxtemp_c"],
          condition: Condition(
              text: data["forecast"]["forecastday"][i]["day"]["condition"]
                  ["text"],
              icon: data["forecast"]["forecastday"][i]["day"]["condition"]
                  ["icon"]),
          is_day: 0,
          temp_f: data["forecast"]["forecastday"][i]["day"]["avgtemp_f"],
          pressure_mb: data["forecast"]["forecastday"][i]["hour"][1]
              ["pressure_mb"],
          humidty:
              data["forecast"]["forecastday"][i]["day"]["avghumidity"].toInt(),
          vis_km: data["forecast"]["forecastday"][i]["day"]["avgvis_km"],
          gust_kph: data["forecast"]["forecastday"][i]["day"]["maxwind_kph"]));

    return list;
  }

}
