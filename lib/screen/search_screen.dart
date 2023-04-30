// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_import
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key, this.updateUi});
  static String id = "Search Screen";
  VoidCallback? updateUi; 

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? cityName; 
 
  TextEditingController controller = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: kPColor,
        title: Padding(
          padding: EdgeInsets.only(left: 20, top: 28),
          child: Text(
            'Search by City Name', style: TextStyle(  
              fontSize: 25.0, 
              color: Colors.white, 
              letterSpacing: 1.0,
               fontFamily: 'lora', 
               fontWeight: FontWeight.bold 
            ),
          ),
        ),
      ),
      body: Column(
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
                )
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   // ignore: prefer_const_literals_to_create_immutables
                   children: [
                    TextField(
                      onChanged: (data)async{
                          cityName = await data;
                      },
                      // controller: controller,
                      onSubmitted: (String data)async{
                        cityName = data;
                        weatherServices services = weatherServices(); 
                        weatherModel? weather = await services.getWether(cityName: cityName!); 
                        // weatherData = weather;
                        Provider.of<weatherProvider>(context, listen: false).weatherData = weather; 
                        // widget.updateUi!();
                        // print(weatherProvider().weatherData.city); // all model data store here
                        
                        weather != null ? Navigator.pop(context) :
                            ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('City Name Not Valid'),
                          ), 
                        );
                        
                      },
                      
                      decoration: InputDecoration(
                        label: Text(
                          'City Name', style: TextStyle(
                              fontSize: 15, 
                              color: kPColor, 
                              fontWeight: FontWeight.bold, 
                              letterSpacing: 0.5, 
                            ),
                          ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 15, top: 8),
                          child: IconButton(
                            
                            onPressed: ()async{
                              weatherServices services = weatherServices(); 
                              weatherModel? weather = await services.getWether(cityName: cityName!); 
                              // weatherData = weather;
                              Provider.of<weatherProvider>(context, listen: false).weatherData = weather; 
                              // widget.updateUi!();
                              // print(weatherProvider().weatherData.city); // all model data store here
                              weather != null ? Navigator.pop(context) : ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('City Name Not Valid', style: TextStyle(
                                    fontSize: 18, 
                                    fontWeight: FontWeight.bold, 
                                    letterSpacing: 1.0
                                  ),
                                ), 
                                backgroundColor: Colors.red, 
                                 
                                ), 
                              );
                            }, 
                            icon: Icon(Icons.search, size: 30, color: Colors.grey,), 
                          ),
                        ),                       
                        border: OutlineInputBorder(  
                          borderRadius: BorderRadius.circular(18), 
                          borderSide: BorderSide(color: kPColor), 
                        ), 
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18), 
                          borderSide: BorderSide(
                            color: kPColor,
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18), 
                          borderSide: BorderSide(
                            color: kPColor
                          ),
                        ),
                        hintText: 'Enter a City Name', 
                        hintStyle: TextStyle(  
                          fontSize: 18, 
                          fontFamily: "RobotoSlab", 
                          letterSpacing: 0.8, 
                          fontWeight: FontWeight.w500,
                          color: Colors.black 
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                      ),
                    ), 
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// weatherModel? weatherData; 