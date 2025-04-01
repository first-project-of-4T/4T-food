import 'dart:async';
import 'package:flutter/material.dart';

class KoreaP2 extends StatefulWidget {
  const KoreaP2({super.key});

  @override
  State<KoreaP2> createState() => _KoreaP2State();
}

class _KoreaP2State extends State<KoreaP2> {
  late List<String> image1;
  late int current;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    image1 = [
      'kimchi3.png',
      'kimchi.png',
    ];
    current = 0;

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      change();
    });
  }

  void change() {
    current++;
    if (current >= image1.length) {
      current = 0;
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _timer.cancel(); // 타이머 중지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(backgroundColor: const Color.fromARGB(255, 51, 68, 145),
      title: Row(
        children: [
          Image.asset('images/korea.png', height: 40, width: 60),
          SizedBox(width: 6),
            Text("한식",style: TextStyle(color: const Color.fromARGB(255, 240, 18, 2)),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "김치찌개",
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
              Expanded(
                child: Text("김치찌개는 잘 익은 김치와 돼지고기를 넣고 끓인 한국대표 찌개.",
                style: TextStyle(fontWeight: FontWeight.bold),
                )
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.circle, size: 6),
              SizedBox(width: 6),
              Expanded(child: Text("국물이 얼큰하고 진해서 밥이랑 찰떡궁합이야.",
                style: TextStyle(fontWeight: FontWeight.bold),
                )
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.circle, size: 6),
              SizedBox(width: 6),
              Expanded(child: Text("한입 먹으면 기분 좋아지는 맛입니다.",
                style: TextStyle(fontWeight: FontWeight.bold),
                )
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.popAndPushNamed(context, '/k1'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text('이전'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => Navigator.popAndPushNamed(context, '/k3'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                
                child: Text('다음'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
