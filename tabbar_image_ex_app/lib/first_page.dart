
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
    cardname = [
      "자기 싫은 짱구",
      "잠들어버린 짱구",
      "양파는 싫은 짱구",
      "민초는 싫은 짱구"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              cardname[currentImage],
              style: const TextStyle(
                fontSize: 25,),
             ),
            Image.asset(
              "images/${imageName[currentImage]}",
              width: 350, height: 400, fit: BoxFit.fill
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                   _onPrev();
                  }
                , child: const Text("이전")
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                  _onNext();
                  }
                , child: const Text("다음")
                ),
              ],
            )
          ],
        ),
      )
          
        
         
      
    );
  }

 //functions
  //이전 버튼을 누를때
  _onPrev() {
    setState(() {
      // 전  이미지
      currentImage--;
      if (currentImage < 0) {
        currentImage = imageName.length - 1;
      }
    });
  }

  //다음 버튼을 누를 때
  _onNext() {
    setState(() {
      currentImage++;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      }
    });
  }

} //end