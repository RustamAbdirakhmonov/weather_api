import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/data/data_repositories/connectivityService.dart';
import 'package:weather_api/data/data_repositories/weatherService.dart';
import 'package:weather_api/prisentation/screens/my_home_page_screen.dart';
import 'package:weather_api/prisentation/screens/search_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context)=>WeatherService()),
        RepositoryProvider(create: (context)=>ConnectivityService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/':(context)=>MyHomePageScreen(),
          SearchScreen.routeArgs:(context)=>SearchScreen(),
        },
      ),
    );
  }
}

