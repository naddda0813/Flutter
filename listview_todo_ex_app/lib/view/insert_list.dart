import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  //property
  late TextEditingController textEditingController;
  late bool _buyswitch;
  late bool _meetswitch;
  late bool _studyswitch;
  late String image;

  @override
  void initState() {
    super.initState();
    // 초기값
    textEditingController = TextEditingController();
    _buyswitch = true;
    _meetswitch = false;
    _studyswitch = false;
    image = "images/cart.png";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text('Add View'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('구매'),
                      Switch(
                          value: _buyswitch,
                          onChanged: (value1) {
                            setState(() {
                              _buyswitch = value1;
                              if (_buyswitch == true) {
                                _meetswitch = false;
                                _studyswitch = false;
                              }
                              if (_buyswitch == false &&
                                  _meetswitch == false &&
                                  _studyswitch == false) {
                                _buyswitch = true;
                              }
                            });
                          }),
                      Image.asset(
                        "images/cart.png",
                        width: 45,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('약속'),
                      Switch(
                          value: _meetswitch,
                          onChanged: (value2) {
                            setState(() {
                              _meetswitch = value2;
                              if (_meetswitch == true) {
                                _studyswitch = false;
                                _buyswitch = false;
                              }
                              // 모두 다 꺼져 있을 때 구매가 디폴트
                              if (_buyswitch == false &&
                                  _meetswitch == false &&
                                  _studyswitch == false) {
                                _buyswitch = true;
                              }
                            });
                          }),
                      Image.asset(
                        "images/clock.png",
                        width: 50,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('스터디'),
                      Switch(
                          value: _studyswitch,
                          onChanged: (value3) {
                            setState(() {
                              _studyswitch = value3;
                              if (_studyswitch == true) {
                                _meetswitch = false;
                                _buyswitch = false;
                              }
                              // 모두 다 꺼져 있을 때 구매가 디폴트
                              if (_buyswitch == false &&
                                  _meetswitch == false &&
                                  _studyswitch == false) {
                                _buyswitch = true;
                              }
                            });
                          }),
                      Image.asset(
                        "images/pencil.png",
                        width: 45,
                      ),
                    ],
                  ),
                ],
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(labelText: "목록을 입력하세요."),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  if (textEditingController.text.trim().isNotEmpty) {
                    addList();
                  }
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          ),
        ),
      ),
    );
  }

//functions
  addList() {
    if (_buyswitch == true) {
      Message.imagePath = "images/cart.png";
    } else if (_meetswitch == true) {
      Message.imagePath = "images/clock.png";
    } else if (_studyswitch == true) {
      Message.imagePath = "images/pencil.png";
    }
    Message.workList = textEditingController.text;
    Message.action = true; // 새로 생김
  }
} //end
