import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class JapanP3 extends StatefulWidget {
  const JapanP3({super.key});

  @override
  State<JapanP3> createState() => _JapanP3State();
}


class _JapanP3State extends State<JapanP3> {
late List<String> imageName;
late int currentImage;

@override
  void initState() {
    super.initState();
    imageName = [
      'pork.jpg',
      'pork2.jpg',
      'pork3.jpg',
    ];
    currentImage = 0;
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
              child: Text('돈카츠',
              style: TextStyle(
                fontSize: 30,
              ),
              ),
            ),
            Center(
              child: SimpleGestureDetector(
                onHorizontalSwipe: (direction) => _onHorizontalSwipe(direction),
                onVerticalSwipe: (direction) => _onVerticalSwipe(direction),
                child: Image.asset('images/${imageName[currentImage]}',
                width: 300,
                height: 300,
                ),
              ),
            ),
            Center(child: Text('독일의 커틀릿이 일본식 변형 \n겉은 바삭 속은 촉촉!.',
            style: TextStyle(fontSize: 20),)),
            SizedBox(height: 15,),
            Text('-> 1900년대 도쿄에서 처음 만들어짐'),
            SizedBox(height: 15,),
            Text('-> 돼지고기 및 생선을 빵가루에 입혀 바삭하게 튀김'),
            SizedBox(height: 15,),
            Text('-> 양배추와 소스, 미소국과 함께 곁들이면서 식사'),
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
                      onPressed: () => Navigator.popAndPushNamed(context, '/'),   
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white                                            
                      ),
                      child: Text('메인'),
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
 Navigator.popAndPushNamed(context, '/j2');
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