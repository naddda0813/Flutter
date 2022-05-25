import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  //property
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    // 초기값
      textEditingController = TextEditingController();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[400],
      appBar :AppBar(
        title: const Text('Add View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: "목록을 입력하세요."
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                if(textEditingController.text.trim().isNotEmpty) {
               addList();
                }
                Navigator.pop(context);
              }, 
              child: const Text("OK"), ),
            ],
          ),
        ),
      ),
    );
  }

//functions
addList() {
  Message.imagePath  = "images/pencil.png";
  Message.workList = textEditingController.text;
  Message.action = true; // 새로 생김 
}

} //end