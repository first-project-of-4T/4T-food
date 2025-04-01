import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class MexicoP2 extends StatefulWidget {
  const MexicoP2({super.key});

  @override
  State<MexicoP2> createState() => _MexicoP2State();
}

class _MexicoP2State extends State<MexicoP2> {
  late List<String> picos;
  late int currentImage;

  @override
  void initState() {
    super.initState();
    picos = [
      'pico1.jpg',
      'pico2.jpg',
      'pico3.jpg',
    ];
    currentImage = 0;
  } // initState

  changeImage(){
    currentImage++;
    if(currentImage >= picos.length){
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
        child: SimpleGestureDetector(
          onHorizontalSwipe: (direction) => _onSwipe(direction),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('피코데 가요',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
                Text('멕시코의 김치',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: Image.asset('images/${picos[currentImage]}',
                  fit: BoxFit.cover,
                  height: 300,
                  width: 400,),
                ),
                Text('피코 데 가요는 멕시코의 전통적인 신선한 살사 소스로, 주로 토마토, 양파, 고수, 라임 주스, 칠리로 만들어집니다.\n타코, 부리또, 나쵸 등과 함께 곁들여 먹으며, 맵고 상큼한 맛이 특징입니다.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                ),),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.popAndPushNamed(context, '/m1'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                        child: Text('이전'),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.popAndPushNamed(context, '/m3'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                        child: Text('다음'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

    _onSwipe(SwipeDirection direction){
    if (direction == SwipeDirection. left || direction == SwipeDirection.right){
      _onHorizontalSwipe(direction);
    }else{
      _onHorizontalSwipe(direction);
    }
  }
  
    _onHorizontalSwipe(SwipeDirection direction){
    if (direction == SwipeDirection.left) { // right to left
      currentImage++;
      if (currentImage >= picos.length) {
        currentImage = 0;
      }
    }else{ // left to right
    currentImage--;
    if (currentImage < 0) {
      currentImage = picos.length-1;
    }
    }
    setState(() {});
  }
}