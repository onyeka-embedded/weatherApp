import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../model/weather_model.dart';

class DataService {
  
  Future<WeatherModel?> getWeather(String city) async {
    WeatherModel? result;
    try {
      final queryParameter = {
        'q': city,
        'appid': 'a32a9e9799fc98a084522140bb03811e',
        'units': 'metric'
      };
      final uri = Uri.https(
          'api.openweathermap.org', '/data/2.5/weather', queryParameter);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(response.body);
        result = WeatherModel.fromJson(json);
      } else {
        print("Error");
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }
}
