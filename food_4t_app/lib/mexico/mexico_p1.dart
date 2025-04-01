import 'dart:async';

import 'package:flutter/material.dart';

class MexicoP1 extends StatefulWidget {
  const MexicoP1({super.key});

  @override
  State<MexicoP1> createState() => _MexicoP1State();
}

class _MexicoP1State extends State<MexicoP1> {
  late List<String> mfoods;
  late int currentImage;

  @override
  void initState() {
    super.initState();
    mfoods = [
      'mfoods1.jpeg',
      'mfoods2.jpg',
      'mfoods3.jpg'
    ];
    currentImage = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      changeImage();
    },);
  } // initState

  changeImage(){
    if (!mounted) return;
    currentImage++;
    if(currentImage >= mfoods.length){
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
            Text('멕시코 음식'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('• 고온 건조한 기후와 다습한 열대 기후가 섞여 있어, \n식재료의 보존과 저장이 중요한 환경',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                ),),
                Text('• 산악 지대와 고원지대가 많아, 이동과 저장이 용이한 간편한 음식이 발달',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                ),),
                Text('\n위같은 환경으로 인해 멕시코에서는 피코데가요와 부리또 같은 간편하고 보관이 용이한 음식들이 발달했습니다.\n이 음식들은 옥수수, 고기, 콩 등을 활용해 쉽게 운반하고 저장할 수 있어,\n건조하거나 고산지대에서도 유용하게 소비되었습니다.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                ),),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 60),
                  child: Image.asset('images/${mfoods[currentImage]}',
                  fit: BoxFit.cover,
                  height: 200,
                  width: 400,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.popAndPushNamed(context, '/'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('메인'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.popAndPushNamed(context, '/m2'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('다음'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}