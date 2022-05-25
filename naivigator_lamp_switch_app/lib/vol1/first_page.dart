import 'package:flutter/material.dart';
import 'package:naivigator_lamp_switch_app/vol1/main.dart';
import 'package:naivigator_lamp_switch_app/vol1/message.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  //property
  late String stringColor; //조명 색
  late String stringOnOff; //조명 onoff
  late bool _switchColor; //  색깔 스위치
  late bool _switchOnOff; //  조명 켜고 끔 스위치

  @override
  void initState() {
    super.initState();
    stringColor = "yellow";
    stringOnOff = "On";
    _switchColor = true;
    _switchOnOff = true;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(stringColor),
                Switch(
                    value: _switchColor,
                    onChanged: (value) {
                      //사용자가 바꾼 값
                      setState(() {
                        _switchColor = value;
                        decisionColor();
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(stringOnOff),
                Switch(
                    value: _switchOnOff,
                    onChanged: (value) {
                      //사용자가 바꾼 값
                      setState(() {
                        _switchOnOff = value;
                        decisionOnOff();
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      decisionLamp();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyHomePage(),
                          ));
                    },
                    child: const Text("OK"))
              ],
            )
          ],
        ),
      ),
    );
  }

//function
//색깔 변경
  decisionColor() {
    if (_switchColor) {
      //true
      stringColor = "yellow";
    } else {
      stringColor = "red";
    }
  }

//조명 끄고 켬
  decisionOnOff() {
    if (_switchOnOff) {
      stringOnOff = "On";
    } else {
      stringOnOff = "Off";
      _switchColor = false; //컬러스위치도 같이 꺼짐
    }
  }

  //램프결정
  decisionLamp() {
    //옐로우 , 전구 켜짐
    if (_switchOnOff == true) {
      Message.image = "images/lamp_on.png";
      if (_switchColor == false) {
        //레드, 전구 켜짐
        Message.image = "images/lamp_red.png";
      }
    }
    //전구 꺼짐
    //_switchOnOff == false
    else {
      Message.image = "images/lamp_off.png";
    }
  }
} //end
