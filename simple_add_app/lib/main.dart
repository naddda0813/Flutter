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
  late TextEditingController numEditingController;
  late TextEditingController numEditingController2;
  late int hap;
  late String resultstring;

  @override
  void initState() {
    numEditingController = TextEditingController();
    numEditingController2 = TextEditingController();
    hap = 0;
    resultstring = ""; //결과를 보여주는 문구, 처음에는 공백으로
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('계산기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: numEditingController,
              decoration: InputDecoration(
                  labelText: "첫번째 숫자를 입력하세요", //  보여주는 글자
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.red),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.amber),
                    borderRadius: BorderRadius.circular(15),
                  )),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: numEditingController2,
              decoration: InputDecoration(
                  labelText: "두번째 숫자를 입력하세요", //  보여주는 글자
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.red),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.amber),
                    borderRadius: BorderRadius.circular(15),
                  )),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (numEditingController.text.trim().isEmpty ||
                    numEditingController2.text.trim().isEmpty) {
                  errorSnackBar(context); //  공백일시 보여주는 문구
                } else {
                  setState(
                    () {
                      //결과값 반영
                      hap = int.parse(numEditingController.text) +
                          int.parse(numEditingController2.text);
                      resultstring = "입력하신 숫자의 합은 $hap입니다.";
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(minimumSize: Size(300, 30) ),
              child: Row(
                children: const [
                  Icon(Icons.add),
                  SizedBox(
                    width: 10,
                  ),
                  Text('덧셈 계산'),
                ],
              ),
            ),
            Text(
              resultstring,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ), // 결과값을 보여주는 문구
          ],
        ),
      ),
    );
  }

  //function
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('입력하신 숫자를 확인하세요'),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
    ));
  }
} //end
