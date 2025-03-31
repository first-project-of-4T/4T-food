import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class ChinaP2 extends StatefulWidget {
  const ChinaP2({super.key});

  @override
  State<ChinaP2> createState() => _ChinaP2State();
}

class _ChinaP2State extends State<ChinaP2> {

    // Property
  late List<String> imageName;
  late int currentImage; // [currentImage]

  @override
  void initState() {
    super.initState();
    imageName = [
      'chinanoodle1.jpg',
      'chinanoodle2.jpg',
    ];

    currentImage = 0;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'images/chinaflag.png',
              width: 80,
              height: 40,
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
              Text("짜장면"),
              Image.asset(
                'images/${imageName[currentImage]}'
              ),
              Text("- 볶은 춘장과 야채, 고기 등의 재료를다시 식용유에\n 볶아 면에 비벼 먹는 한국식 중화 요리이다."),
              Text("- 본래 중국 요리 중 하나인 작장면이 한국으로 유입된 뒤\n 변형, 현지화되면서 파생한 요리로, 현지화 과정에서\n 맛이나 형태가 원본과는 많이 달라진 음식이다."),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.popAndPushNamed(context, '/c1'),
                    child: Text('이전')
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.popAndPushNamed(context, '/c3'),
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