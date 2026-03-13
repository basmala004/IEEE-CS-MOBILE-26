import 'package:flutter/material.dart';
import 'package:project/home_Screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home_Screen()
    );
  }

}
