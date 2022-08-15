import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherapp/pages/scroll_page.dart';
import 'package:weatherapp/pages/weather_parameter.dart';
import 'package:weatherapp/state_manager/provider.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final weatherModel = Provider.of<DataClass>(context, listen: false);
    weatherModel.getWeatherData("Lagos");
  }

  final PageController _controller = PageController();
  final TextEditingController _tController = TextEditingController();

  String _selectedVal = "Lagos";
  String city = 'Lagos';
  List<String> cities = [
    "Lagos",
    "Benin City",
    "Abuja",
    "Kano",
    "Awka",
    "Gombe",
    "Asabe",
    "Enugu",
    "Nibo",
    "Nimo",
    "Orland",
    "Texas",
    "Chelsea",
    "Manchester",
    "London",
  ];
  @override
  Widget build(BuildContext context) {
    final weatherModel = Provider.of<DataClass>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // String? temp =  weatherModel.weatherData?.mainD.temp?.toInt().toString();
    return Container(
      child: weatherModel.isLoading
          ? Container(
            color: Colors.white,
              child: SpinKitThreeBounce(
                  duration: const Duration(seconds: 1),
                  itemBuilder: (BuildContext context, index) {
                    print("true");
                    return DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: index.isEven ? Colors.red : Colors.green),
                    );
                  }),
            )
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Container(
                  height: h,
                  width: w,
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/images/mainpage.jpg"),
                          fit: BoxFit.cover)),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.menu),
                          Text(
                            weatherModel.allData != null
                                ? weatherModel.allData.cityName
                                : "City not found", //?? "Select City",
                            style: _bcustomStyle(),
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: GestureDetector(
                                  onTap: () {
                                    //  AnimatedIcons.pause_play;
                                    weatherModel.getWeatherData(_selectedVal);
                                  },
                                  child: const Icon(
                                    Icons.refresh,
                                  ))),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        // margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: w * 0.28,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(10)),
                              child: DropdownButton(
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                ),
                                iconSize: 20,
                                elevation: 4,
                                value: _selectedVal,
                                // style: subTitleStyle,
                                underline: Container(height: 0),
                                onChanged: (String? newvalue) {
                                  weatherModel.getWeatherData(newvalue!);
                                  _selectedVal = newvalue;
                                },
                                items: cities.map<DropdownMenuItem<String>>(
                                  (String? value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child:
                                          Text(value!, style: _customStyle()),
                                    );
                                  },
                                ).toList(),
                              )),
                          Container(
                              //padding: const EdgeInsets.only(right: 5),
                              height: 45,
                              width: w * 0.6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey.shade300),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: w * 0.5,
                                    child: TextField(
                                      controller: _tController,
                                      style: _customStyle(),
                                      decoration: InputDecoration(
                                        hintText: "Search city",
                                        border: InputBorder.none,
                                        prefixIcon: const Icon(Icons.search),
                                        hintStyle: _customStyle(),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 45,
                                        decoration: const BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                            )),
                                        child: GestureDetector(
                                            onTap: () {
                                              if (_tController
                                                  .text.isNotEmpty) {
                                                weatherModel.getWeatherData(
                                                    _tController.text);
                                                    _tController.clear();
                                                // _selectedRepeat = _tController.text;
                                              } else {}
                                            },
                                            child: const Icon(Icons.done,
                                                color: Colors.white))),
                                  ),
                                ],
                              ))
                        ])),
                    SizedBox(
                      height: h / 20,
                    ),
                    Container(
                      height: 100,
                      width: 170,
                     decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(50)
                     ),
                      child: Center(
                        child: Text(
                      weatherModel.allData != null
                          ? (weatherModel.allData.mainD.temp
                                  .toInt()
                                  .toString() +
                              " \u2103")
                          : "",
                      style: TextStyle(
                          fontFamily: "Mukta",
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800),
                        )),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Container(
                        height: h / 3,
                        width: w,
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    child: WeatherParameter(
                                        parameter: "Temperature",
                                        value: weatherModel.allData != null
                                            ? (weatherModel.allData.mainD.temp
                                                    .toInt()
                                                    .toString() +
                                                " \u2103")
                                            : "nan", //"24 \u2103",
                                        icons: WeatherIcons.thermometer)),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: WeatherParameter(
                                        parameter: "Humidity",
                                        value: weatherModel.allData != null
                                            ? (weatherModel.allData.mainD.hum.toString() + "mmHg")
                                            : "nan",
                                        icons: WeatherIcons.humidity)),
                              ]),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children:[
                                Expanded(
                                    child: WeatherParameter(
                                        parameter: "Wind",
                                        value: weatherModel.allData != null
                                            ? (weatherModel.allData.wind.speed.toString() + "m/s")
                                            : "nan",
                                        icons: WeatherIcons.wind)),
                                const SizedBox(
                                  width: 10,
                                ),
                                 Expanded(
                                    child: WeatherParameter(
                                        parameter: "Visibility",
                                        value:  weatherModel.allData != null
                                            ? (weatherModel.allData.visibility.toString() + "m")
                                            : "nan",
                                        icons: WeatherIcons.sunset)),
                              ]),
                        ])),
                  SizedBox(height: h*0.05,),
                    Container(
                      height: h * 0.18,
                      width: w,
                      child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          //controller: _controller,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return const ScrowPage(
                                icons: WeatherIcons.day_sunny,
                                tempVal: "--",
                                time: "--:--");
                          }),
                    )
                  ]),
                ),
              ),
            ),
    );
  }

  TextStyle _customStyle() {
    return TextStyle(
        fontFamily: "Mukta",
        fontSize: 13,
        fontWeight: FontWeight.normal,
        color: Colors.grey.shade800);
  }

  TextStyle _bcustomStyle() {
    return TextStyle(
        fontFamily: "Mukta",
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade800);
  }
}
