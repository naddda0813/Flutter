import 'package:bmi_app/message.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 234, 211),
      appBar: AppBar(
        title: Text('계산 결과'),
      ),
      body: Column(
        mainAxisAlignment :  MainAxisAlignment.center,
        children: [
          Text('BMI 결과는요!'),
          Text(Message.isObesity),
          Image.asset(Message.isObesity,
          width: 30,
          height: 200,)
        ],
      ),
    );
  }
}


