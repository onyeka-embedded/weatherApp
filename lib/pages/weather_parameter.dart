import 'package:flutter/material.dart';

class WeatherParameter extends StatelessWidget {
  final String value;
  final String parameter;
  final IconData icons;
  const WeatherParameter(
      {Key? key,
      required this.parameter,
      required this.value,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 15),
      height: h / 8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icons, size: 35),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                parameter,
                style: _bcustomStyle(),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(value, style: _scustomStyle())
            ],
          )
        ],
      ),
    );
  }

  TextStyle _scustomStyle() {
    return TextStyle(
        fontFamily: "Mukta",
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Colors.grey.shade500);
  }

  TextStyle _bcustomStyle() {
    return TextStyle(
        fontFamily: "Mukta",
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade800);
  }
}
