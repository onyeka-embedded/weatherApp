import 'package:flutter/material.dart';

class ScrowPage extends StatelessWidget {
  final IconData icons;
  final String tempVal;
  final String time;
  const ScrowPage(
      {Key? key,
      required this.icons,
      required this.tempVal,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: h * 0.17,
      width: w / 3,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("lib/images/listv.jpg"), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(35)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            tempVal+" \u2103",
            style: _bcustomStyle(),
          ),
          // SizedBox(height: 20,),
          Icon(
            icons,
            size: 50, color: Colors.white,
          ),
        SizedBox(height: 10,),
          Text(
            time,
            style: _customStyle(),
          )
        ],
      ),
    );
    ;
  }

  TextStyle _customStyle() {
    return const TextStyle(
        fontFamily: "Mukta",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white70);
  }
  TextStyle _bcustomStyle() {
    return const TextStyle(
        fontFamily: "Mukta",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 7, 37, 51));
  }
}
