import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/model/todo_list.dart';
import 'package:listview_todo_app/view/detail_list.dart';

class TableList extends StatefulWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  List<TodoList> todoList = [];

  @override
  void initState() {
    super.initState();
    todoList
        .add(TodoList(imagePath: "images/cart.png", workList: "책구매")); //책구매 리스트
    todoList.add(
        TodoList(imagePath: "images/clock.png", workList: "철수와 약속")); //책구매 리스트
    todoList.add(TodoList(
        imagePath: "images/pencil.png", workList: "스터디 준비하기")); //책구매 리스트
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text("Main view"),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: () {
              //insert 페이지로 이동 
              Navigator.pushNamed(
                context, "/insert"
                ).then((value) => rebuildData());  // 입력받은 함수를 출력하기 
            },
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, position) {
              //내용, 위치
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                child: GestureDetector(
                  onTap: () {
                    Message.workList = todoList[position].workList;
                    Message.imagePath = todoList[position].imagePath;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailList(),
                        ));
                  },
                  child: Card(
                    color: position % 2 == 0
                        ? const Color.fromARGB(255, 146, 152, 196)
                        : const Color.fromARGB(255, 215, 132, 81),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            todoList[position].imagePath,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          todoList[position].workList,
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
//function
rebuildData() {
  setState(() {
  // 게속 리스트가 만들어짐 
  todoList.add(TodoList(imagePath: Message.imagePath, workList: Message.workList));
  Message.action = false ; //다시 처음으로 돌림 
  });
}

} //end
