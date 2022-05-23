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
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('짱구는 못말려~'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageName[currentImage],
            ),
            Text(
              cardname[currentImage],
              style: TextStyle(
                fontSize: 25,
              ),
              ),
            //image를 wrap with container
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromARGB(255, 4, 28, 39),
                          width: 5,
                        )),
                    child: Image.asset("images/${imageName[currentImage]}",
                        width: 350, height: 400, fit: BoxFit.fill),
                  ),
                ),
                //image를 wrap with container
                //미리보기 기능
                Positioned(
                  left: 260,  //260만큼 오른쪽으로 감 
                  top: 10,  //10만큼 내림
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amber,
                        width:3,
                      )
                    ),
                    child: Image.asset(
                      "images/${imageName[currentImage < imageName.length - 1? currentImage+1 : 0]}",
                      fit :BoxFit.fill,
                      width:100,
                      height:150,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _onPrev();
                    },
                    child: const Text("<<이전")),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      _onNext();
                    },
                    child: const Text("다음>>")),
              ],
            ),
          ],
        ),
      ),
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
