import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/state_manager/provider.dart';

import 'pages/appscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>DataClass(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        
          primarySwatch: Colors.blue,
        ),
        home: const AppScreen(),
      ),
    );
  }
}
