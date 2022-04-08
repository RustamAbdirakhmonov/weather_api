import 'package:weather_api/data/models/condition.dart';

class CurrentWeather {
  String last_updated;
  double temp_c;
  double temp_f;
  int is_day;
  Condition condition;
  double pressure_mb;
  int humidty;
  double vis_km;
  double gust_kph;


  CurrentWeather({
    required this.last_updated,
    required this.temp_c,
    required this.condition,
    required this.is_day,
    required this.temp_f,
    required this.pressure_mb,
    required this.humidty,
    required this.vis_km,
    required this.gust_kph
  });
}
