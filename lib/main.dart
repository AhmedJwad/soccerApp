import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soccerflutter/screen/home_screen.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Soccer app',
     home: HomeScreen(),
    );
  }
}