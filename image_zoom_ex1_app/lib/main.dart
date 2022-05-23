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
  late String _lampImage; //image name
  late double _lampWidth; //image width
  late double _lampHeight; //image height
  late bool _sizeswitch; //switch size status
  late bool _onoffswitch; //switch on- off, status

  @override
  void initState() {
    super.initState();
    // 초기값
    _lampImage = "images/lamp_on.png";
    _lampWidth = 150;
    _lampHeight = 300;
    _sizeswitch = true; //축소
    _onoffswitch = true; //불켜짐
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('image 확대 및 축소'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 650,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _lampImage,
                    width: _lampWidth,
                    height: _lampHeight,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text('전구 확대'),
                    Switch(
                        //크기 확대 축소 스위치
                        value: _sizeswitch,
                        onChanged: (value1) {
                          //사용자가 바꾼값
                          setState(() {
                            _sizeswitch = value1;
                            decisionSize();
                          });
                        }),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const Text('전구 스위치'),
                    Switch(
                        // 전구 불 켜기 끄기 스위치
                        value: _onoffswitch,
                        onChanged: (value2) {
                          setState(() {
                            _onoffswitch = value2;
                            decisionOnOff();
                          });
                        }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//functions

//크기 결정
  decisionSize() {
    if (_sizeswitch) {
      //true
      _lampWidth = 300; //스물이면 바꿔주기
      _lampHeight = 600;
    } else {
      //false
      _lampWidth = 150; //스물이면 바꿔주기
      _lampHeight = 300;
    }
  } // decisionSize - end

// 전구 켜기 결정
  decisionOnOff() {
    if (_onoffswitch) {
      //true
      _lampImage = "images/lamp_on.png";
    } else {
      _lampImage = "images/lamp_off.png";
    }
  } // decisionOnOff - end

} //end
