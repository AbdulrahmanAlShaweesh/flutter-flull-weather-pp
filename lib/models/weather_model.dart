
import 'package:flutter/material.dart';

class weatherModel {
    String date; 
    String city; 
    double temp; 
    double maxTemp; 
    double minTemp;
    String weather;
    String weatherIcon; 

  weatherModel({
    required this.date, 
    required this.city, 
    required this.temp, 
    required this.maxTemp, 
    required this.minTemp, 
    required this.weatherIcon, 
    required this.weather
  });

  factory weatherModel.fromJson(dynamic data) {
    return weatherModel(
      date: data["location"]["localtime"].toString().substring(11,), 
      city: data["location"]["name"], 
      temp: data["forecast"]["forecastday"][0]["day"]["avgtemp_c"], 
      maxTemp: data["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: data["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weatherIcon: data["current"]["condition"]["icon"], 
      weather: data["current"]["condition"]["text"], 
    );
  }

  datae(){
    return Colors.red;
  }
  @override
  String toString() {
    return "date $date\ncity $city\ntemp ${temp}\nmaxTemp $maxTemp\nminTemp $minTemp\nicon $weatherIcon\nweather condition $weather";
  }
}