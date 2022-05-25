import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:listview_image_tap_ex_app/flag_item.dart';

class SecondPage extends StatefulWidget {
  final List<Flag> list;
  const SecondPage({Key? key, required this.list}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //property
  final nameController = TextEditingController();
  int _radioValue = 0; //대륙 분류 , 디폴트 = 0
  bool travel = false; //여행한 곳인지 체크
  var _imagePath;
  String flagKorean = "";
  String flagEnglish = "";
  String continent = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //radio button
                  Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _radioChange),
                  const Text("아시아"),
                  Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _radioChange),
                  const Text("유럽"),
                  Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _radioChange),
                  const Text("북아메리카"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("간 적 있나요?"),
                  Checkbox(
                      value: travel,
                      onChanged: (check) {
                        //check 변수
                        setState(() {
                          travel = check!;
                        });
                      })
                ],
              ),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/korea.png";
                        setState(() {
                          flagKorean = "한국";
                          flagEnglish = "Korea";
                        });
                      },
                      child: Image.asset(
                        "images/korea.png",
                        width :80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/spain.png";
                        setState(() {
                          flagKorean = "스페인";
                          flagEnglish = "Spain";
                        });
                      },
                      child: Image.asset(
                        "images/spain.png",
                        width :80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/china.png";
                        setState(() {
                          flagKorean = "중국";
                          flagEnglish = "China";
                        });
                      },
                      child: Image.asset(
                        "images/china.png",
                        width :80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/chille.png";
                        setState(() {
                          flagKorean = "칠레";
                          flagEnglish = "chile";
                        });
                      },
                      child: Image.asset(
                        "images/chille.png",
                        width :80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/us.png";
                        setState(() {
                          flagKorean = "한국";
                          flagEnglish = "USA";
                        });
                      },
                      child: Image.asset(
                        "images/us.png",
                        width :80,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(flagKorean),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(flagEnglish),
              ),
              ElevatedButton(
                onPressed: () {
                  
                  _showDialog(context);
                }
              , child: const Text("문제 추가하기"))
            ],
          ),
        ),
      ),
    );
  }

  //functions
  _radioChange(int? value) {
    //디폴트가 따로 없어 null safety가 있음
    // 값 세팅
    setState(() {
      _radioValue = value!; //null 빼내기
    });
  }

  //글자 입력 받기 
  getKind(int radioValue) {
    switch(radioValue) {
      case 0 : return "아시아";
      case 1 : return "유럽";
      case 2 : return "북아메리카";
    }
  }

  //카드 경고창 보여주기
  _showDialog(BuildContext context) {
    var flag = Flag(
                    imagePath: _imagePath, 
                    flagKorean: nameController.text, 
                    continent : getKind(_radioValue),
                    flagEnglish: flagEnglish);
    showDialog(
      context: context, 
      builder: (BuildContext ctx){
      return AlertDialog(
        title: Text("문제 추가하기"),
        content: Text(
          "이 국기의 문제는  ${flagKorean[0]}${" _ " *(flagKorean.length -1)} 입니다.\n"
          "정답은 ${flagKorean} 입니다\n"
          "영어명은 ${flagEnglish} 입니다\n"
          "대륙명은 ${continent} 입니다\n"
          "이 문제를 추가하시겠습니까?"
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              widget.list.add(flag);
              Navigator.of(context).pop();
            }
          , child: const Text("예")),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            }
          , child: const Text("아니오",
           style: TextStyle(color: Colors.red),
          )),
        ],
      );
    });
  }

} //end
