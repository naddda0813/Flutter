import 'package:flutter/material.dart';
import 'package:naviagator_lamp_app/main.dart';
import 'package:naviagator_lamp_app/message.dart';

class Modify extends StatefulWidget {
  final String text;
  final bool lighting;
  const Modify({Key? key, required this.text, required this.lighting}) : super(key: key);

  @override
  State<Modify> createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
  //property
  late TextEditingController controller;  
  late String imageName; 
  late bool switchOnOff;
  late String lights; //전구 불 글씨 바꾸기 
  late List list;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
    imageName = Message.imageName;    //이미지
    switchOnOff = widget.lighting;  //스위치값 받기
    lights = "";
    list =[]; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("수정화면"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "글자를 입력하세요"
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(lights),
              Switch(
                value: switchOnOff, 
                onChanged: (value) {
                    switchOnOff = value;
                  setState(() {
                    decisionOnOff();
                  });
                }),
            ],
            ),
            ElevatedButton(
              onPressed: () {
                decisionLamp();
              }, child: const Text("OK"))
          ],
        ),
      ),
    );
  }

  //function
  //스위치 글자 바꾸기 
  decisionOnOff() {
    //true
    if(switchOnOff) {
      lights = "On";
      Message.imageName = "images/lamp_on.png";
    } //fasle
    else {
      lights = "Off";
      Message.imageName = "images/lamp_off.png";
    }
  }

  //램프결정
  decisionLamp() {
    list = [];
    list.add(controller.text);
    list.add(imageName);
    list.add(switchOnOff.toString());
    Navigator.pop(context,list);
  }

} //end