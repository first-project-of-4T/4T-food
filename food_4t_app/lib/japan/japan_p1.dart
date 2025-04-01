import 'dart:async';
import 'package:flutter/material.dart';

class JapanP1 extends StatefulWidget {
  const JapanP1({super.key});

  @override
  State<JapanP1> createState() => _JapanP1State();
}

class _JapanP1State extends State<JapanP1> {
late List<String> imageName;
late int currentImage;
late Timer timer;

@override
  void initState() {
    super.initState();
    imageName = [
      'susi.jpg',
      'timer1.jpg',
      'timer2.jpg',
      'timer3.jpg',
      'timer4.jpg',
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
  void dispose() {
    timer.cancel();
    super.dispose();
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text('일식 소개',
                style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold
                          ),
                ),
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Icon(Icons.house),
                  Text(' 바다로 둘러싸인 섬',
                  style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.house),
                  Text(' 사계절이 뚜렷한 기후',
                  style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Text('신선한 해산물이 식탁의 중심이 되며 정갈합니다. \n대표적인 음식은 스시,돈카츠가 있습니다.'),
              Text('제철 재료를 살려 최대한 담백하게 즐깁니다. \n간장, 와사비 같은 기본 소스와 음식의 조화'),
              SizedBox(height: 15,),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 260,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.redAccent,
                      width: 7,
                      ),
                    ),
                    child: Image.asset('images/${imageName[currentImage]}',
                    fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.popAndPushNamed(context, '/'),                  
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white
                    ),
                    child: Text('메인'),
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
              )
            ],
          ),
        ),
      ),
    );
  }//build
nextviewButton(){
 Navigator.popAndPushNamed(context, '/j2');

}

}