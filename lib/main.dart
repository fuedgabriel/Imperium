import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/Login.dart';
import 'screens/Widget/BottonBar.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Imperium',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: Login(),
      routes: <String, WidgetBuilder>{
        '/BottonBar': (BuildContext context) => BottonBar(),
        '/Login': (BuildContext context) => Login(),

      },
    );
  }
}
