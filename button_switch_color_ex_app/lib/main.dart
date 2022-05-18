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
  State<MyHomePage> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage> {
  late bool switchValue;
  late Color _buttonColor;
  late String _image;
  @override
  void initState() {
    switchValue = false;
    _buttonColor = Colors.blue;
    _image = "images/jjangku-1.png";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[500],
      appBar: AppBar(
        title: const Text('짱구 재우기'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(_image),
              radius :150,
            ),
            ElevatedButton(
              onPressed: () {
               //
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_buttonColor),
              ),
              child: const Text('재우기'),

            ),
            const SizedBox(
              height: 50,
            ),
            Switch(
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                   if (switchValue == false) {
                   _buttonColor = Colors.blue;
                  _image = "images/jjangku-1.png";
                 } else {
                   _buttonColor = Colors.red;
                  _image = "images/jjangku-2.png";
                 }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

} //end 
