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
  late String displayCharacter;
  late String character; //현재화면
  late List str = []; //한글자씩 쪼개기
  late int currentCh; //리스트 번호

  @override
  void initState() {
    displayCharacter = "HELLO";
    str = displayCharacter.split('');
    currentCh = 0;
    character = str[currentCh];
    super.initState();

    //timer 설치
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      split();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고'),
      ),
      body: Center(
        child: Text(
          character,
          style: TextStyle(fontSize: 60, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

//functions
//글씨 띄우기
  split() {
    setState(() {
      
      currentCh++; // list 번호 증가
      if (currentCh >= str.length ) { //1을 하지 않으면 o 앞까지만 출력 
        currentCh = 0;
        character = str[currentCh];   //h 보여주기 
      } else {
      character += str[currentCh];
      }

    });
  }
} //end
