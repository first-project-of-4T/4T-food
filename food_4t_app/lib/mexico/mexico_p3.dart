import 'dart:async';

import 'package:flutter/material.dart';

class MexicoP3 extends StatefulWidget {
  const MexicoP3({super.key});

  @override
  State<MexicoP3> createState() => _MexicoP3State();
}

class _MexicoP3State extends State<MexicoP3> {
  late List<String> burritos;
  late int currentImage;

  @override
  void initState() {
    super.initState();
    burritos = [
      'burrito1.jpeg',
      'burrito2.jpg',
      'burrito3.jpeg'
    ];
    currentImage = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      changeImage();
    },);
  } // initState

  changeImage(){
    if (!mounted) return;
    currentImage++;
    if(currentImage >= burritos.length){
      currentImage = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: 
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 90),
              child: Image.asset('images/mexico.png',
              width: 60,
              height: 40,),
            ),
            Text('멕시코'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('\n멕시코의 전통적이고 대표적인 음식',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),),
              Text('부리또',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Image.asset('images/${burritos[currentImage]}',
                fit: BoxFit.cover,
                height: 300,
                width: 400,),
              ),
              Text('부리또는 멕시코의 대표적인 간편 음식으로, 보통 안에는 고기(소고기, 돼지고기, 닭고기 등), 콩, 쌀, 치즈, 상추, 살사 등이 들어가며, 취향에 따라 다양한 재료를 추가할 수 있습니다. 부리또는 포장하여 쉽게 먹을 수 있어 멕시코뿐만 아니라 전 세계에서 인기가 많습니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.popAndPushNamed(context, '/m2'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                      child: Text('이전'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.popAndPushNamed(context, '/'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                      child: Text('메인'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}