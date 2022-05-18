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
  late String _buttonState; //text
  late String _buttonTitle; //button
  late Color _buttonColor; //buttoncolor

  @override
  void initState() {
    _buttonState = "OFF"; // 초기값
    _buttonTitle = "버튼을 누르세요"; // 초기값
    _buttonColor = Colors.amber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Life Cycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _onClick();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_buttonColor),
              ),
              child: Text(_buttonTitle),
            ),
            const SizedBox(
              height: 50,
            ),
            Text("버튼 상태 : $_buttonState"),
          ],
        ),
      ),
    );
  }

//functions
  _onClick() {
    setState(() {
      if (_buttonState == "OFF") {
        _buttonState = "ON";
        _buttonTitle = 'Tap a button';
        _buttonColor = Colors.red;
      } else {
        _buttonState = "OFF";
        _buttonTitle = '버튼을 누르세요';
        _buttonColor = Colors.amber;
      }
    });
  }
} //end
