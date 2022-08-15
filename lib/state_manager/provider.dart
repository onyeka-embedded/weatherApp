import 'package:flutter/cupertino.dart';
import 'package:weatherapp/data_services/dataservices.dart';
import 'package:weatherapp/model/weather_model.dart';

class DataClass extends ChangeNotifier{
  DataService dataService = DataService();
  WeatherModel? _weatherData;
  bool isLoading = false;
    get allData  => _weatherData;
   // get isLoading => _isLoading;
  getWeatherData(String city) async {
      isLoading = true;
   //notifyListeners();
    _weatherData = (await dataService.getWeather(city));
    isLoading =  false;
    notifyListeners();
  }
}