import 'package:flutter/material.dart';

class KoreaP1 extends StatefulWidget {
  const KoreaP1({super.key});

  @override
  State<KoreaP1> createState() => _KoreaP1State();
}

class _KoreaP1State extends State<KoreaP1> {

  
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(backgroundColor: const Color.fromARGB(255, 55, 76, 170),
      title: Row(
        children: [
          Image.asset('images/korea.png', height: 40, width: 60),
          SizedBox(width: 6),Text
          ("한식",style: TextStyle(color: const Color.fromARGB(255, 240, 18, 2),),)
            
        ],
      ),
    ),
body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "한국의 음식",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
      ),
      SizedBox(height: 16),
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
              CircleAvatar(radius: 100,
        backgroundImage:AssetImage('images/korea.png')
        )

      ],
      ),
      Row(
        children: [
          Icon(Icons.circle, size: 6),
          SizedBox(width: 6),
          Text("한국 음식은 발효와 국물 요리가 발달해 깊은 맛을 자랑한다.",
          style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
      Row(
        children: [
          Icon(Icons.circle, size: 6),
          SizedBox(width: 6),
          Text("김치찌개는 김치와 돼지고기를 넣고 끓인 얼큰한 찌개요리.",
          style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
      Row(
        children: [
          Icon(Icons.circle, size: 6),
          SizedBox(width: 6),
          Text("삼계탕은 인삼과 찹쌀을 넣은 닭 요리로 여름 보양식.",
          style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
      Row(
        children: [
          Icon(Icons.circle, size: 6),
          SizedBox(width: 6),
          Text("건강과 계절을 고려한 조화로운 식문화가 특징입니다.",
          style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () => Navigator.popAndPushNamed(context,'/' ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                 child: Text('메인')),
          
            ElevatedButton(onPressed: () => Navigator.popAndPushNamed(context,'/k2' ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Text('다음')),
          ],
        ),

              ],
  ),
                  ),
  );
}
}