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
        primarySwatch: Colors.red,
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
  late String _buttonName; //button name
  late bool _switch; //switch status
  late String _lampSizeStaus; // image size staus

  @override
  void initState() {
    super.initState();
    //초기값
    _lampImage = "images/lamp_on.png";
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = "Image 확대";
    _switch = true;
    _lampSizeStaus = 'small';
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
                Image.asset(   //  sizedbox는 하나밖에 못해서 컬럼으로 감싸야 함 
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
              TextButton(
                onPressed: () {
                  setState(() {
                    decisonLampSize();
                  });
                },
                child: Text(_buttonName),
              ),
              const SizedBox(
                width: 20,
              ),
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('전구 스위치'),
              Switch(
                  value: _switch,
                  onChanged: (value) {
                    //
                    setState(() {
                      _switch = value;
                      decisionOnOff();
                    });
                  })
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
  decisionOnOff() {
    if (_switch) {
      //true
      _lampImage = "images/lamp_on.png";
    } else {
      _lampImage = "images/lamp_off.png";
    }
  }

decisonLampSize() {
    if(_lampSizeStaus == "small") {
     _lampWidth = 300;        //스물이면 바꿔주기 
    _lampHeight = 600;
    _buttonName = "image 축소";
    _lampSizeStaus = "large";
  } else{
    _lampWidth = 150;        //빅 이면 바꿔주기 
    _lampHeight = 300;
    _buttonName = "image 확대";
    _lampSizeStaus = "small";
  }
}

} //end
