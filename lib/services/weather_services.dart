
// ignore_for_file: unused_local_variable, camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart'; 

class weatherServices {
  String baseUrl = "http://api.weatherapi.com/v1"; 
  String apiKey  = "";
   
  Future<weatherModel?> getWether({required String cityName}) async {
    weatherModel? weather; 
    
    try{
      Uri url = Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7");
      http.Response response = await http.get(url);
      
      Map<String, dynamic> data = jsonDecode(response.body);  
      weather = weatherModel.fromJson(data);
    }catch(e){
      print(e);
    }
    return weather; 
  }
}