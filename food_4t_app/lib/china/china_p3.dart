import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'dart:async';

class ChinaP3 extends StatefulWidget {
  const ChinaP3({super.key});

  @override
  State<ChinaP3> createState() => _ChinaP3State();
}

class _ChinaP3State extends State<ChinaP3> {

    // Property
  late List<String> imageName;
  late int currentImage; // [currentImage]
  late Timer timer;  




  @override
  void initState() {
    super.initState();
    imageName = [
      'tang1.jpg',
      'tang2.jpeg',
      'tang3.jpeg',
    ];

    currentImage = 0;


  // Timer설치
  timer = Timer.periodic(Duration(seconds: 3), (timer){ // 3초마다 실행
    changeImage();
  },);      


  } //initState


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
              Text("부먹? VS 찍먹?",
              style: TextStyle(
                fontSize: 15,
              ),),              
              Text("탕수육",
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
              Text("- 돼지고기에 녹말 반죽을 묻혀서 기름에 튀긴 후 \n\n  설탕과 식초, 채소, 녹말물을 주재료로 만든\n\n  새콤달콤한 소스와 함께 먹는 중화요리다.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),              
              Text(""),
              Text("- 고기를 정육면체로 썰어 튀김의 크기가 작고\n \n동글동글하며 마른 녹말을 입혀 튀기는 것이 특징.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.popAndPushNamed(context, '/c2'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber
                      ),                    
                    child: Text('이전')
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.popAndPushNamed(context, '/'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber
                      ),                    
                    child: Text('메인')
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }//build
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