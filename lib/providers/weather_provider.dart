
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class weatherProvider extends ChangeNotifier{
  weatherModel? _weatherData;

  set weatherData(weatherModel? weather){
    _weatherData = weather; 
    notifyListeners();
  }

  weatherModel? get weatherData {
    return _weatherData;
  }
}