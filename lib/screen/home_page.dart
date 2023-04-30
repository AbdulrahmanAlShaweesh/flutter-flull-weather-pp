
// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screen/search_screen.dart';
import 'package:intl/intl.dart';
import '../providers/weather_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static String id = "HomeScreen";
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
}

  void updateUi() {
    setState(() {
      
    });
  }
  List weekdays = ['Monday', 'Tusday', 
                    'wednesda', "Thursday", 
                    "Friday", "Satarday", "Sunday"
                  ];
  
  _timeMode() {
    

   }

  @override
  Widget build(BuildContext context) {
    //  weatherData = Provider.of<weatherProvider>(context).weatherData;
    
    return Scaffold(
      backgroundColor: kPColor,
      appBar: AppBar(
        toolbarOpacity: 0.6,
        elevation: 0.0,
        backgroundColor: kPColor,
        title: Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Text('Weather App', style: TextStyle(   
              fontSize: 27, 
              letterSpacing: 1.0, 
              fontFamily: 'Lora', 
              fontWeight: FontWeight.bold, 
              color: Colors.white, 
            ),
          ),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2, top: 20),
            child: IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SearchScreen(
                    updateUi: updateUi,
                  );
                }));
              }, icon: Icon(Icons.search, size: 28,color: Colors.white,), 
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 22, right: 12),
            child: PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Logout', 'Settings'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice, style: TextStyle(  
                        fontFamily: 'Lora', 
                        fontWeight: FontWeight.bold, 
                        letterSpacing: 1.2, 
                        fontSize: 18, 
                        color: Colors.grey
                      ),
                    ),
                  );
                }).toList();
              },color: Colors.white,
            ),
          ),
        ],
      ),
      body: Provider.of<weatherProvider>(context).weatherData == null ? Column(  
        children: [
          Container(
            height: 120, 
            width: double.infinity,
            color: kPColor,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ), 
              ),
              child: Center(
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                   // ignore: prefer_const_literals_to_create_immutables
                   children: [
                    Text('There is no Weather 😞 Start', style: TextStyle(  
                        fontSize: 22, 
                        fontFamily: 'RobotoSlab', 
                        fontWeight: FontWeight.w500, 
                        letterSpacing: 1.0
                      ),
                    ),
                    SizedBox(height: 15,), 
                    Text('Search Now  🔍', style: TextStyle(
                        fontSize: 22, 
                        fontFamily: 'RobotoSlab', 
                        fontWeight: FontWeight.w500, 
                        letterSpacing: 1.0, 
                      ),
                    ), 
                  ],
                ),
              ),
            ), 
          ),
        ],
      ) : Column(
          children: [
            Container(
              height: 120, 
              width: double.infinity,
              color: kPColor,
            ), 
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  ), 
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 100),
                    child: Column(  
                      // mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                    
                        Text(
                          
                          Provider.of<weatherProvider>(context).weatherData!.city, style: TextStyle(
                            fontSize: 30, 
                            letterSpacing: 0.8, 
                            fontWeight: FontWeight.bold, 
                          ),
                        ), 
                        SizedBox(height: 10,),
                        Text(
                          'Updated: ${weekdays[DateTime.now().weekday-1]} ${Provider.of<weatherProvider>(context).weatherData!.date} ${int.parse(Provider.of<weatherProvider>(context).weatherData!.date.substring(0,Provider.of<weatherProvider>(context).weatherData!.date.indexOf(":"))) >= 12 ? "PM": "AM"}', style: TextStyle(
                            fontSize: 18, 
                            letterSpacing: 0.8,  
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 50),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                               Image.network("https:${Provider.of<weatherProvider>(context).weatherData!.weatherIcon}",), 
                              // Icon(Icons.sunny, size: 50, color: Colors.orange,), 
                              Text(
                                '${Provider.of<weatherProvider>(context).weatherData!.temp}', style: TextStyle(
                                  fontSize: 30, 
                                  letterSpacing: 0.8,  
                                ),
                              ), 
                              Column(
                                children: [
                                  Text(
                                    'max temp ${Provider.of<weatherProvider>(context).weatherData!.maxTemp}', style: TextStyle(
                                      fontSize: 18, 
                                      letterSpacing: 0.8,  
                                    ),
                                  ), 
                                  SizedBox(height: 7,),
                                  Text(
                                    'min temp ${Provider.of<weatherProvider>(context).weatherData!.minTemp}', style: TextStyle(
                                      fontSize: 18, 
                                      letterSpacing: 0.8, 
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text(Provider.of<weatherProvider>(context).weatherData!.weather, style: TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.bold, 
                          letterSpacing: 0.8, 
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
      ),
    );
  }
}