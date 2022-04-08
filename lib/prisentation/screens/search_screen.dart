import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/blocs/weather_bloc.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const routeArgs='/search';
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String ?location;
  var texEditingController=TextEditingController();
  @override
  Widget build(BuildContext context1) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return   Scaffold(
       body: Container(
         decoration: BoxDecoration(
             gradient: LinearGradient(
                 begin: FractionalOffset.topCenter,
                 end: FractionalOffset.bottomCenter,
                 tileMode: TileMode.repeated,
                 colors: [
                   Color(0xAA30A2C5),
                   Color(0xAA00242F),
                 ])),
           padding: EdgeInsets.only(top: 50),
           child: Column(
             children: <Widget>[
               Container(
                 padding: EdgeInsets.all(15),
                 width: width,
                 height: height*.4,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(40),
                 ),
                 child: Column(
                   children: <Widget>[
                     Align(
                       alignment: Alignment.topRight,
                       child: IconButton(onPressed: (){
                         print(texEditingController.value.text);
                         BlocProvider.of<WeatherBloc>(context).add(LoadApiEvent(location: texEditingController.value.text.toString()));
                         Navigator.of(context).pop();
                         },
                       icon: Icon(Icons.clear,size: 28,),),
                     ),
                     Container(
                         decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(30)),
                         width: width*.7,
                         child: TextField(
                           style: TextStyle(
                             fontSize: 24,
                             decoration: TextDecoration.none,
                           ),
                           decoration: InputDecoration(
                             disabledBorder: InputBorder.none,
                             border: InputBorder.none,
                             contentPadding: EdgeInsets.only(left: 20),
                           ),
                           controller: texEditingController,
                         ))
                   ],
                 ),
               )
             ],
           ),



       ),
    );
  }
}
