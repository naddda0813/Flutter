import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //property
  late List imageName;
  late int currentImage;
  late List cardname;

  @override
  void initState() {
    super.initState();
    imageName = [
      "jjangku-1.png",
      "jjangku-2.png",
      "jjangku-3.png",
      "jjangku-4.png"
    ];
    currentImage = 0; //초기값
    //name
    cardname = ["자기 싫은 짱구", "잠들어버린 짱구", "양파는 싫은 짱구", "민초는 싫은 짱구"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second page'),
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
                cardname[currentImage],
                style: const TextStyle(
                  fontSize: 25,
                ),
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
      if (direction == SwipeDirection.left) {
        //left
        currentImage += 1;
        // 더이상 보여줄 이미지가 없을 때 , 첫이미지 보여주기
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        //right
        currentImage -= 1;
        if (currentImage < 0) {
          //  1에서 스와이프할때 6번째 이미지 보여주기
          currentImage = imageName.length - 1;
        }
      }
    });
  }

  _onVerticalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.down) {
        currentImage += 1;
        // 더이상 보여줄 이미지가 없을 때 , 첫이미지 보여주기
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        //right
        currentImage -= 1;
        if (currentImage < 0) {
          //  1에서 스와이프할때 6번째 이미지 보여주기
          currentImage = imageName.length - 1;
        }
      }
    });
  }
} //end
