import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/data/data_repositories/connectivityService.dart';
import 'package:weather_api/data/data_repositories/weatherService.dart';
import 'package:weather_api/logic/blocs/weather_bloc.dart';
import 'package:weather_api/prisentation/screens/search_screen.dart';

class MyHomePageScreen extends StatefulWidget {
  const MyHomePageScreen({Key? key}) : super(key: key);

  @override
  State<MyHomePageScreen> createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen> {
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return BlocProvider(
      create: (context) =>
      WeatherBloc(
          connectivityService:
          RepositoryProvider.of<ConnectivityService>(context),
          weatherService: RepositoryProvider.of<WeatherService>(context,listen: false))..add(LoadApiEvent(location:"Tashkent")),
      child: Scaffold(
        body: BlocBuilder<WeatherBloc, WeatherState>(


         builder: (context, state) {
           if(state is RouteNextPage){
             return SearchScreen();
           }
          if (state is WeatherLoadingState) {
            return Container(
              width: width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      tileMode: TileMode.repeated,
                      colors: [
                        Color(0xAA30A2C5),
                        Color(0xAA00242F),
                      ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10, top: 25),
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(SearchScreen.routeArgs);
                              },
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(" "),
                      Text(
                        " ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 36),
                      ),
                      Text(
                        " ",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width * .5,
                        height: width * .5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xAA30A2C5).withOpacity(.8),
                                offset: Offset(0, 1.0),
                                blurRadius: 10,
                              )
                            ]),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Color(0xAA30A2C5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "Wind status",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                " ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Visibility",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                " ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "Air pressure",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                " ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Humidity",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                " ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<WeatherBloc>(context)
                                .add(LoadApiEvent(location: "Tashkent"));
                          },
                          child: Text('Push The Button')),
                    ],
                  ),
                  Container(
                    width: width,
                    height: height * .3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(60))),
                  )
                ],
              ),
            );
          }
          if (state is WeatherLoadedState) {
            return Container(
              width: width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      tileMode: TileMode.repeated,
                      colors: [
                        Color(0xAA30A2C5),
                        Color(0xAA00242F),
                      ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10, top: 25),
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => BlocProvider.value(
                                      value: BlocProvider.of<WeatherBloc>(context),
                                      child: SearchScreen(),
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                            "${DateFormat.MMMM().format(DateTime.parse(state.currentWeather.last_updated))} ${DateFormat.d().format(DateTime.parse(state.currentWeather.last_updated))}th ${DateFormat.y().format(DateTime.parse(state.currentWeather.last_updated))}",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "${state.currentRegion.name}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 36),
                      ),
                      Text(
                        "${state.currentRegion.country}",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        height:200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xAA30A2C5).withOpacity(.8),
                                offset: Offset(0, 6.0),
                                blurRadius: 10,
                              )
                            ]),
                        child: state == WeatherLoadingState
                            ? Center(
                          child: CircularProgressIndicator(),
                        )
                            : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              "https:" +
                                  state.currentWeather.condition.icon,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              state.currentWeather.temp_c
                                  .toStringAsFixed(0) +
                                  "°C",
                              style: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "Wind status",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "${state.currentWeather.gust_kph}Km/h",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Visibility",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "${state.currentWeather.vis_km} Km",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "Air pressure",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "${state.currentWeather.pressure_mb
                                    .toStringAsFixed(0)} mb",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Humidity",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "${state.currentWeather.humidty} %",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<WeatherBloc>(context)
                                .add(LoadApiEvent(location: "Tashkent"));
                          },
                          child: Text('Push The Button')),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: width * .1, left: 10, right: 10, bottom: 10),
                    width: width,
                    height: height * .32,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(60))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("The next 3 days", style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),),
                        SizedBox(height: 0,),
                        Container(
                          width: width,
                          height: height * .22,
                          child: GridView.builder(
                            padding: EdgeInsets.only(left: 10, top: 20),
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 20,
                              maxCrossAxisExtent: 100,
                              childAspectRatio: 3 / 6,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(onTap: () {
                                BlocProvider.of<WeatherBloc>(context)
                                    .add(LoadFutureEvent(index: index, location: "Tashkent"));

                              },
                                  child: FutureWeatherItem(
                                      temp: state.list[index].temp_c.toString(),
                                      date: state.list[index].last_updated,
                                      iconUrl: state.list[index].condition.icon,
                                      width: width));
                            },
                            itemCount: state.list.length,

                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          if (state is WeatherNoInternetState) {
            return Center(
              child: Text("No Internet"),
            );
          }
          return Container();



        },
        ),
      ),
    );
  }
}

class FutureWeatherItem extends StatelessWidget {
  FutureWeatherItem(
      {Key? key, required this.temp, required this.date, required this.iconUrl, required this.width})
      : super(key: key);
  double width;
  String date;
  String iconUrl;
  String temp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("${DateFormat("EEEE").format(DateTime.parse(date))}",
            style: TextStyle(fontSize: 16),),
          SizedBox(
            height: 10,
          ),
          Container(
            width: width * .25,
            height: width * .3,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network("http:" + iconUrl),
                Text(
                  "${temp}°C",
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
