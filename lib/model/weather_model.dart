class WeatherModel{
  final String cityName;
  final int visibility;
  final MainModel mainD;
  final WindModel wind;


  WeatherModel({ required this.cityName, required this.mainD, required this.wind, required this.visibility});

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    
    return WeatherModel(
      cityName:  json['name'] ?? "",
      visibility:  json['visibility'] ?? "",
      mainD: MainModel.fromJson(json['main'] ?? ""),
      wind: WindModel.fromJson(json['wind'] ?? ""),
    );
  }
  
}
class MainModel{
  final double? temp;
  final int? hum;

  MainModel({this.temp, this.hum});

  factory MainModel.fromJson(Map<String, dynamic> json){

    return MainModel(
       temp: json['temp'] ?? "",
      hum: json['humidity'] ?? "",
    );
  }

}
class WindModel{
  final double speed;
  WindModel({required this.speed});

  factory WindModel.fromJson(Map<String, dynamic> json){
    return WindModel(
       speed: json['speed'] ?? "",
    );
  }

}