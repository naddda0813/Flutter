import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //property 
  //광고문고 입력받기 
  late TextEditingController inputCh; //입력받는 값 
  late String displayString; //입력받은 값을 공백 없애줌 
  late List displayList =[]; //입력받은 값을 리스트로 받음
  late String character; //현재화면
  late int currentCh; //리스트 번호

@override
  void initState() {
    //광고문구 컨트롤러 
    inputCh = TextEditingController();
    displayString = "";
    currentCh = 0;
    character ="";
    super.initState();

    //timer 설치
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      disPlay();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LED 광고"),
        leading: IconButton(
          onPressed: () {
            //
          },
          icon: Icon(Icons.menu),
        ),
      ),
      drawer: Drawer(
        child: Center(
          child: Column(
            children: [
             Container(
              width : 320,
              height: 200,
              decoration:const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),)
              ),
              child: Column(
                children:  [
                  SizedBox(
                    height: 100,
                  ),
                  Text("광고 문구를 입력하세요",
                  style: TextStyle(fontSize: 25),),
                ],
           ),
             ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: inputCh, //컨트롤러 이름 
                 decoration: InputDecoration(labelText: "글자를 입력하세요."),
                 keyboardType: TextInputType.text,
                 ),
              ),
              ElevatedButton(
                onPressed: () {
                  showString(context);
                }, 
                child: const Text("광고문구 생성")),
            ],
          ),
        ),
      ),
      body: Center(
        child:
        Text(character)
      ),
    );

  }

  //functions
  showString(BuildContext context) {
    setState(() {
      displayString =inputCh.text.trim(); //  공백제거 
      displayList =displayString.split('');    //쪼개기 
    });
       Navigator.pop(context);
  } 

  //한글자씩 쪼개서 넣기
  disPlay() {
    setState(() {
      if (currentCh >= displayList.length ) { //1을 하지 않으면 o 앞까지만 출력 
        currentCh = 0;
        character = displayList[currentCh];   //보여주기 
      } else {
      character += displayList[currentCh];
      }
       currentCh++; // list 번호 증가
       
    });
  }



}//end
