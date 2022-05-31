import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rserve_iris_app/message.dart';

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
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;
  //입력받는값
  late double sepalLength = 0;
  late double sepalWidth = 0;
  late double petalLength = 0;
  late double petalWidth = 0;
  late String result;
  late String irisImage;

  //초기화
  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
    result = "all";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Iris 품종 예측")),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                children: [
                  TextField(
                    controller: controller1,
                    decoration: const InputDecoration(
                      labelText: "Sepal Length의 크기를 입력하세요",
                      hintText: "4.0",
                    ),
                    //소수점 입력
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    maxLines: 1,
                  ),
                  TextField(
                    controller: controller2,
                    decoration: const InputDecoration(
                      labelText: "Sepal Length의 크기를 입력하세요",
                      hintText: "4.0",
                    ),
                    //소수점 입력
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    maxLines: 1,
                  ),
                  TextField(
                    controller: controller3,
                    decoration: const InputDecoration(
                      labelText: "Sepal Width의 크기를 입력하세요",
                      hintText: "3.0",
                    ),
                    //소수점 입력
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    maxLines: 1,
                  ),
                  TextField(
                    controller: controller4,
                    decoration: const InputDecoration(
                      labelText: "petal Length의 크기를 입력하세요",
                      hintText: "2.0",
                    ),
                    //소수점 입력
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        irisPredict();
                      },
                      child: const Text("입력")),
                  CircleAvatar(
                    backgroundImage: AssetImage("images/$result.jpg"),
                    radius: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//functions

  Future<bool> irisPredict() async {
    var url = Uri.parse(
        'http://localhost:8080/Rserve/response_iris.jsp?sepalLength=${controller1.text}&sepalWidth=${controller2.text}&petalLength=${controller3.text}&petalWidth=${controller4.text}');
    var response = await http.get(url);

    setState(() {
      var JSON = json.decode(utf8.decode(response.bodyBytes));
      print(['result']);
      result = JSON['result'];
      _showDialog();
    });
    return true;
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("품종 예측 결과"),
            content: Text("입력하신 품종은 $result입니다."),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"))
            ],
          );
        });
  }
} //end
