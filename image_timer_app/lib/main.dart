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
        primarySwatch: Colors.indigo,
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
  late List imageName;
  late int currentImage;

  @override
  void initState() {
      //화면 뜨기전에 
    super.initState();
    imageName = [
      "jjangku-1.png",
      "jjangku-2.png",
      "jjangku-3.png",
      "jjangku-4.png",
    ];
    currentImage = 0; //초기값
    
    //timer 설치
    Timer.periodic(const Duration(seconds: 3), (Timer timer) { 
      changeImage();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Image Swiping'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(imageName[
                    currentImage] //첫 이미지를 변수명으로 스와이프 할때마다, 숫자를 넣으면 새로 작성해야함
                ),
            Image.asset(
              "images/${imageName[currentImage]}",
              width: 350,
              height: 600,
            ),
          ],
        ),
      ),
    );
  }

// function
changeImage() {
  setState(() {
    currentImage++;
    if(currentImage >= imageName.length) {
      //초기화
      currentImage = 0 ; 
    }
  });
}

} //end
