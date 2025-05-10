import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget { //  stateful로 바꿈!
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Property
  ThemeMode _themeMode = ThemeMode.system; // 사용자 시스템에 있는 테마모드

  _changeThemeMode(ThemeMode themeMode){
    _themeMode = themeMode;
    setState(() {});
  }

  static const seedColor = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: _themeMode,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: seedColor
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: seedColor
      ),
      home: Home(onChangeTheme: _changeThemeMode), // const 삭제
    );
  }
}// Class