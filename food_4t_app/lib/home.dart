import 'package:flutter/material.dart';
import 'package:food_4t_app/china/china_p1.dart';
import 'package:food_4t_app/japan/japan_p1.dart';
import 'package:food_4t_app/korea/korea_p1.dart';
import 'package:food_4t_app/mexico/mexico_p1.dart';
import 'package:food_4t_app/start.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Start(),
          KoreaP1(),
          ChinaP1(),
          JapanP1(),
          MexicoP1(),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: [
          Tab(
            icon: Icon(
              Icons.house,
            ),
            text: "Home",
          ),
          Tab(
            icon: Icon(
              Icons.looks_one,
            ),
            text: "한국",
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
            ),
            text: "중국",
          ),
          Tab(
            icon: Icon(
              Icons.looks_3,
            ),
            text: "일본",
          ),
          Tab(
            icon: Icon(
              Icons.looks_4,
            ),
            text: "멕시코",
          ),
        ],
      ),
    );
  }
}