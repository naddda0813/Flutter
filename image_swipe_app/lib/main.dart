import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

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
    super.initState();
    imageName = [
      "flower_01.png",
      "flower_02.png",
      "flower_03.png",
      "flower_04.png",
      "flower_05.png",
      "flower_06.png"
    ];
    currentImage = 0; //초기값
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Image Swiping'),
      ),
      body: SimpleGestureDetector(
        //좌우 
        onHorizontalSwipe: _onHorizontalSwipe,
        //상하
        onVerticalSwipe: _onVerticalSwipe,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                imageName[currentImage]         //첫 이미지를 변수명으로 스와이프 할때마다, 숫자를 넣으면 새로 작성해야함 
              ),
              Image.asset(
                "images/${imageName[currentImage]}",
                width: 350,
                height: 600,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //functions 
  _onHorizontalSwipe(SwipeDirection direction) {
    
    setState(() {
    if(direction == SwipeDirection.left) {     //left
    currentImage +=1;
    // 더이상 보여줄 이미지가 없을 때 , 첫이미지 보여주기 
      if(currentImage >= imageName.length) {
        currentImage = 0;
      }
    } else {    //right 
      currentImage -=1;
      if(currentImage <0) { //  1에서 스와이프할때 6번째 이미지 보여주기 
        currentImage = imageName.length -1;
      }
    }
    });
  }

  _onVerticalSwipe(SwipeDirection direction) {
    setState(() {
      if(direction == SwipeDirection.down) {
        currentImage +=1;
      // 더이상 보여줄 이미지가 없을 때 , 첫이미지 보여주기 
      if(currentImage >= imageName.length) {
        currentImage = 0;
      }
      } else {    //right 
      currentImage -=1;
      if(currentImage <0) { //  1에서 스와이프할때 6번째 이미지 보여주기 
        currentImage = imageName.length -1;
      }


    });
  }

}//end
