import 'package:flutter/material.dart';
import 'package:food_4t_app/china/china_p1.dart';
import 'package:food_4t_app/china/china_p2.dart';
import 'package:food_4t_app/china/china_p3.dart';
import 'package:food_4t_app/japan/japan_p1.dart';
import 'package:food_4t_app/japan/japan_p2.dart';
import 'package:food_4t_app/japan/japan_p3.dart';
import 'package:food_4t_app/korea/korea_p1.dart';
import 'package:food_4t_app/mexico/mexico_p1.dart';
import 'package:food_4t_app/mexico/mexico_p2.dart';
import 'package:food_4t_app/mexico/mexico_p3.dart';

import 'home.dart';
import 'korea/korea_p2.dart';
import 'korea/korea_p3.dart';
import 'start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => Home(),
        '/start' : (context) => Start(),
        '/k1' : (context) => KoreaP1(),
        '/k2' : (context) => KoreaP2(),
        '/k3' : (context) => KoreaP3(),
        '/j1' : (context) => JapanP1(),
        '/j2' : (context) => JapanP2(),
        '/j3' : (context) => JapanP3(),
        '/c1' : (context) => ChinaP1(),
        '/c2' : (context) => ChinaP2(),
        '/c3' : (context) => ChinaP3(),
        '/m1' : (context) => MexicoP1(),
        '/m2' : (context) => MexicoP2(),
        '/m3' : (context) => MexicoP3(),
      },
    );
  }
}