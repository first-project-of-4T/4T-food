import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'dart:async';


class JapanP2 extends StatefulWidget {
  const JapanP2({super.key});

  @override
  State<JapanP2> createState() => _JapanP2State();
}

class _JapanP2State extends State<JapanP2> {
late List<String> imageName;
late int currentImage;
late Timer timer;

@override
  void initState() {
    super.initState();
    imageName = [
      'susi.jpg',
      'susi2.jpg',
      'susi3.jpg',
    ];
    currentImage = 0;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
    ChageImage();
    },
    );
  }//init

  ChageImage(){
    if (!mounted) return;
  currentImage++;
  if(currentImage >= imageName.length){
    currentImage = 0;
  }
  setState(() {  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
           Image.asset('images/japan.jpg',
            height: 40,
            width: 60,
            ),
            Spacer(),
            Text('일본'),
            Spacer(),
          ],
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('스시',
                style: TextStyle(
                fontSize: 30,
              ),
              ),
            ),
            Center(
              child: SimpleGestureDetector(
                onHorizontalSwipe: (direction) => _onHorizontalSwipe(direction),
                onVerticalSwipe: (direction) => _onVerticalSwipe(direction),
                child: CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage('images/${imageName[currentImage]}',
                  // width: 300,
                  // height: 300,
                  ),
                ),
              ),
            ),
            Center(child: Text('생선을 보관하기 위한 발효 저장 음식 \n입안에서 바다가 느껴져요.',
            style: TextStyle(fontSize: 20),)),
            SizedBox(height: 15,),
            Text('-> 에도 시대 에도앞 스시가 시초'),
            SizedBox(height: 15,),
            Text('-> 간장에 살짝 찍어 먹고 입에 넣기 좋은 한입 크기로 먹음'),
            SizedBox(height: 15,),
            Text('-> 생산 맛을 제대로 느끼기 위해 생강으로 입안을 정리'),
        
             Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        previewButton();
                      }, 
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white                                              
                      ),
                      child: Text('이전'),
                      ),
                    ElevatedButton(
                      onPressed: () {
                        nextviewButton();
                      }, 
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white                                              
                      ),
                      child: Text('다음'),
                      ),
                  ],
                ),
              )
        
          ],
        ),
      ),
    );
  }//build
previewButton(){
 Navigator.popAndPushNamed(context, '/j1');
}

nextviewButton(){
 Navigator.popAndPushNamed(context, '/j3');

}

_onHorizontalSwipe(SwipeDirection direction){
  if(direction == SwipeDirection.left){ //right to lsft
    currentImage++;
    if(currentImage >= imageName.length){
      currentImage = 0;
    }
  }else{ //left to right
    currentImage--;
  if(currentImage < 0){
    currentImage = imageName.length - 1;
   }
  }
  setState(() {  });
}

_onVerticalSwipe(SwipeDirection direction){
  if(direction == SwipeDirection.up){ //down to up
    currentImage++;
    if(currentImage >= imageName.length){
      currentImage = 0;
    }
  }else{ //up to down
    currentImage--;
  if(currentImage < 0){
    currentImage = imageName.length - 1;
   }
  }
  setState(() {  });
}

}