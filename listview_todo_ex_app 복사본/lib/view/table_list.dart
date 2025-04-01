import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';
import 'package:listview_todo_ex_app/model/todo_list.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  // Property
  late List<TodoList> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];
    addData();
  }


  addData(){
    todoList.add(TodoList(imagePath: 'images/cart.png', workList: '책구매'));
    todoList.add(TodoList(imagePath: 'images/clock.png', workList: '철수와 약속'));
    todoList.add(TodoList(imagePath: 'images/pencil.png', workList: '스터디 준비하기'));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main View"),
        actions: [ // 앱바 버튼은 actions 로 만든다
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/insert').then((value) => rebuildData()); // 화면 넘어갔다가 일마치고 돌아올 때를 then으로 적용해준다.
            },
            icon: Icon(Icons.add_outlined)
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return GestureDetector( // 카드는 터치기능이 없다. 그래서 제스쳐디텍터를 넣어줘야한다.
              onTap: () {
                Message.imagePath = todoList[index].imagePath;
                Message.workList = todoList[index].workList; // message.dart에서 선언한 Static Class
                Navigator.pushNamed(context, '/detail');
              },
              child: SizedBox(
                height: 60,
                child: Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          todoList[index].imagePath,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,0,0,0),
                        child: Text(
                          todoList[index].workList,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }//build

  // == Functions ==

  rebuildData(){
    if(Message.action == true){
      todoList.add(TodoList(imagePath: Message.imagePath, workList: Message.workList));
      Message.action = false; // 데이터를 넣었으니 너는 옛날 데이터야
    }
    
    setState(() {});
  }
}//Class