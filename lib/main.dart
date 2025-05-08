import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:tasks/Screens/Screen1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Screen1());
  }
}
