import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'dart:async';

class ChinaP2 extends StatefulWidget {
  const ChinaP2({super.key});

  @override
  State<ChinaP2> createState() => _ChinaP2State();
}

class _ChinaP2State extends State<ChinaP2> {

    // Property
  late List<String> imageName;
  late int currentImage; // [currentImage]
  late Timer timer;  

  @override
  void initState() {
    super.initState();
    imageName = [
      'chinanoodle1.jpg',
      'chinanoodle2.jpg',
            
    ];

    currentImage = 0;

  // Timer설치
  timer = Timer.periodic(Duration(seconds: 3), (timer){ // 3초마다 실행
    changeImage();
  },);        
  } // initState

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

    changeImage(){
    currentImage++;
    if(currentImage >= imageName.length){
      currentImage = 0;
    }
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,100,0),
              child: Image.asset(
                'images/chinaflag.png',
                width: 60,
                height: 40,
              ),
            ),
            Text('중식'),
          ],
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: (direction) => _onHorizontalSwipe(direction),
        onVerticalSwipe: (direction) => _onVerticalSwipe(direction),           
        child: Center(
          child: Column(
            children: [
              Text("중식하면 가장 먼저 떠오르는",
              style: TextStyle(
                fontSize: 15,
              ),),
              Text("짜장면",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),),
              
              Image.asset(
                'images/${imageName[currentImage]}',
                fit: BoxFit.cover,
                width: 400,
                height: 300,
              ),
              Text("그림을 스와이프 해보세요",
                style: TextStyle(
                  fontSize: 10
                ),),
              Text(""),
              Text("- 볶은 춘장과 야채, 고기 등의 재료를다시 식용유에\n\n  볶아 면에 비벼 먹는 한국식 중화 요리이다.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              Text(""),
              Text("- 본래 중국 요리 중 하나인 작장면이 한국으로 유입된 뒤\n\n  변형, 현지화되면서 파생한 요리로, 현지화 과정에서\n\n    맛이나 형태가 원본과는 많이 달라진 음식이다.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.popAndPushNamed(context, '/c1'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber
                      ),                    
                    child: Text('이전')
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.popAndPushNamed(context, '/c3'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber
                      ),                    
                    child: Text('다음')
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }//Build
  //funcitons//
  _onHorizontalSwipe(SwipeDirection direction){
    if(direction == SwipeDirection.left){ //right to left
      currentImage++;
      if(currentImage >= imageName.length){
        currentImage = 0;
      }
    }else{ // left to right
      currentImage--;
      if(currentImage < 0){
        currentImage = imageName.length - 1;
      }
    }

    setState(() {});
  }

  _onVerticalSwipe(SwipeDirection direction){
    if(direction == SwipeDirection.down){ //up to down
      currentImage++;
      if(currentImage >= imageName.length){
        currentImage = 0;
      }
    }else{ // left to right
      currentImage--;
      if(currentImage < 0){
        currentImage = imageName.length - 1;
      }
    }

    setState(() {}); // 바뀐 property를 bulid에게 알려주는 역할. build는 화면을 그리는 역할.
  }



}//Class