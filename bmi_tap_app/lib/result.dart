
import 'package:bmi_tap_app/message.dart';
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
        title: const Text('계산 결과'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment :  MainAxisAlignment.center,
              children: [
                const Text('BMI 결과는!',
                style: TextStyle(
                    fontSize: 35,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(Message.calcresult,
                style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(Message.isObesity,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.indigo,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Image.asset(Message.image,
                width: 200,
                height: 600,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


