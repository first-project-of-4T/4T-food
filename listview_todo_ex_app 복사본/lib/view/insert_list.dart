import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {

  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('구매'),
                  Switch(
                    value: Message.switchBuy,
                    onChanged: (value) {
                      Message.switchBuy = value;
                      addViewSwitchOnOFF();
                    },
                  ),
                  Image.asset(
                    'images/cart.png',
                    height: 30,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('약속'),
                  Switch(
                    value: Message.switchPromise,
                    onChanged: (value) {
                      Message.switchPromise = value;
                      addViewSwitchOnOFF();
                    },
                  ),
                  Image.asset(
                    'images/clock.png',
                    height: 30,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('스터디'),
                  Switch(
                    value: Message.switchStudy,
                    onChanged: (value) {
                      Message.switchStudy = value;
                      addViewSwitchOnOFF();
                    },
                  ),
                  Image.asset(
                    'images/pencil.png',
                    height: 30,
                  ),
                ],
              ),
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: '목록을 입력하세요',
                ),
                keyboardType: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if(textEditingController.text.trim().isNotEmpty){
                      addList();
                    }
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }//build
  // -- functions --

  addViewSwitchOnOFF(){
    if(Message.switchBuy == true){
      Message.switchPromise = false;
      Message.switchStudy = false;
      Message.imagePath = 'images/cart.png';
    }else if(Message.switchPromise == true){
      Message.switchBuy = false;
      Message.switchStudy = false;
      Message.imagePath = 'images/clock.png';
    }else if(Message.switchStudy == true){
      Message.switchBuy = false;
      Message.switchPromise = false;
      Message.imagePath = 'images/pencil.png';
    }
    setState(() {});
  }

  addList(){
    Message.workList = textEditingController.text;
    Message.imagePath;
    Message.action = true;

  
  }


}//class