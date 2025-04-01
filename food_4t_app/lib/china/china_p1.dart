import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'dart:async';

class ChinaP1 extends StatefulWidget {
  const ChinaP1({super.key});

  @override
  State<ChinaP1> createState() => _ChinaP1State();
}

class _ChinaP1State extends State<ChinaP1> {
  



    // Property
  late List<String> imageName;
  late int currentImage; // [currentImage]
  late Timer timer;



  @override
  void initState() {
    super.initState();
    imageName = [
      'chinafood1.jpg',
      'chinafood2.jpeg',
      'chinafood3.jpg'
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text("중식이 기름조리가 발달한 이유",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                ),
                Text(""),
                Text("-> 바다와 멀리 떨어져 있어 날생선 음식이 적고,\n     물의 위생 문제가 있기 때문",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                Text(""),
                Text("-> 내륙 지방이 바다와 멀리 떨어져 있어\n     날생선 음식이 적고 가열 조리가 발달",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                Text(""),
                Text("-> 물에 흙내가 나고 비위생적이라 물로 조리하면\n 식감과 향도 나빠지고 위생 문제를 일으킬 수 있다",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                Text(""),
                Text("-> 기름을 활용한 조리법은 대량의 식재료를\n       단시간에 조리할 수 있다",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.popAndPushNamed(context, '/'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber
                      ),
                      child: Text('메인')
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.popAndPushNamed(context, '/c2'),
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