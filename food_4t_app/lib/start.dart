import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'images/klandmark1.jpeg',
                    fit: BoxFit.cover,
                    width: 170,
                    height: 170,
                  ),
                  Image.asset(
                    'images/clandmark1.png',
                    fit: BoxFit.cover,
                    width: 170,
                    height: 170,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Text(
                  '세계의 음식들',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                ),
              ),
              Text('한국, 중국, 일본, 멕시코 편\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),),
              Text('4조 제작',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Text('\n아래 국기를 눌러주세요',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23
                  ),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'images/jlandmark1.jpg',
                    fit: BoxFit.cover,
                    width: 170,
                    height: 170,
                  ),
                  Image.asset(
                    'images/mlandmark1.jpg',
                    fit: BoxFit.cover,
                    width: 170,
                    height: 170,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}