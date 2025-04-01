import 'dart:async';

import 'package:flutter/material.dart';

class KoreaP3 extends StatefulWidget {
  const KoreaP3({super.key});

  @override
  State<KoreaP3> createState() => _KoreaP3State();
}

class _KoreaP3State extends State<KoreaP3> {
  late List<String> image1;
  late int current;
  late Timer _timer;

  @override
  void initState() {

    super.initState();{
      image1 = [
        'chicken.png',
        'chicken2.png',
      ];
      current = 0;
      _timer = Timer.periodic(Duration(seconds: 3), (timer) {
        change();
      });
    }
  }

  change(){
    current++;
    if(current>=image1.length){
      current=0;
    }
    if (mounted) {
      setState(() {
        
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(backgroundColor: const Color.fromARGB(255, 64, 82, 160),
      title: Row(
        children: [
          Image.asset('images/korea.png', height: 40, width: 60),
          SizedBox(width: 6),
          Text("한식",style: TextStyle(color: const Color.fromARGB(255, 240, 18, 2)),),
          ],
        ),
      ),
      body: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      "삼계탕",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 16),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage('images/${image1[current]}'),
        ),
      ],
    ),
    SizedBox(height: 16),
    Row(
      children: [
        Icon(Icons.circle, size: 6),
        SizedBox(width: 6),
        Expanded(child: Text(
          "삼계탕은 영계(어린 닭) 안에 인삼, 찹쌀, 대추 등을 넣고 푹 끓인 보양식이야.",
                style: TextStyle(fontWeight: FontWeight.bold),
                )
          ),
      ],
    ),
    Row(
      children: [
        Icon(Icons.circle, size: 6),
        SizedBox(width: 6),
        Expanded(child: Text("여름철 더위에 기력을 보충하기 위해 초복, 중복, 말복에 자주 먹어.",
                style: TextStyle(fontWeight: FontWeight.bold),
                )
        ),
      ],
    ),
    Row(
      children: [
        Icon(Icons.circle, size: 6),
        SizedBox(width: 6),
        Expanded(child: Text("한입 먹으면 기분 좋아지는맛.",
                style: TextStyle(fontWeight: FontWeight.bold),
                )
        ),
      ],
    ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () => Navigator.popAndPushNamed(context,'/k2' ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                 child: Text('이전',style: TextStyle(fontWeight: FontWeight.normal),)
                 ),
            ElevatedButton(onPressed: () => Navigator.popAndPushNamed(context,'/' ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Text('다음',style: TextStyle(fontWeight: FontWeight.normal))
          ),
          ],
        ),

  ],
),
      );
      }
  }
