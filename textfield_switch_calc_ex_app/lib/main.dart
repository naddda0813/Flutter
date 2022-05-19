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
  late TextEditingController numEditingController; //1. 숫자
  late TextEditingController numEditingController2; //2. 숫자

  late TextEditingController SumResult; // 덧셈
  late TextEditingController MinusResult; //뺄셈
  late TextEditingController MultiResult; //곱셈
  late TextEditingController DivideResult; //나눗셈

  //switch
  late bool switchsum; // 덧셈
  late bool switchminus; //뺄셈
  late bool switchmulti; //곱셈
  late bool switchdivide; //나눗셈

  @override
  void initState() {
    numEditingController = TextEditingController();
    numEditingController2 = TextEditingController();
    SumResult = TextEditingController();
    MinusResult = TextEditingController();
    MultiResult = TextEditingController();
    DivideResult = TextEditingController();
    //switch //처음엔 다 계산 
    switchsum = true;
    switchminus = true;
    switchmulti = true;
    switchdivide = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간단한 계산기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
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
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    onPressed: () {
                      numcalc(context);
                    },
                    
                    child: Text('계산 하기'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                        onPressed: () {
                          remove(context);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red)),
                        child: const Text('지우기')),
                  ),
                ]),
                // 덧셈
                Row(
                  children: [
                    Text("덧셈"),
                    Switch(
                      value: switchsum,
                      onChanged: (value) {
                        setState(() {
                          switchsum = value;
                          if (switchsum == false) {
                          SumResult.text= "";
                          } else {
                            SumResult.text =  (int.parse(numEditingController.text) +
                           int.parse(numEditingController2.text)).toString();
                          }
                        });
                      },
                    ),
                    //뺄셈
                    Text("뺄셈"),
                    Switch(
                      value: switchminus,
                      onChanged: (value) {
                        setState(() {
                          switchminus = value;
                          if (switchminus == false) {
                             MinusResult.text = "";
                          } else {
                            MinusResult.text =(int.parse(numEditingController.text) -
                           int.parse(numEditingController2.text)).toString();
                          }
                        });
                      },
                    ),
                  // 곱셈 
                  Text("곱셈"),
                    Switch(
                      value: switchmulti,
                      onChanged: (value) {
                        setState(() {
                          switchmulti = value;
                          if (switchmulti == false) {
                            MultiResult.text = "";
                          } else { 
                             MultiResult.text = (int.parse(numEditingController.text) *
                           int.parse(numEditingController2.text)).toString();
                          }
                        });
                      },
                    ),
                  Text("나눗셈"),
                    Switch(
                      value: switchdivide,
                      onChanged: (value) {
                        setState(() {
                          switchdivide = value;
                          if (switchdivide == false) {
                           DivideResult.text = "";
                          } else {
                             DivideResult.text =(double.parse(numEditingController.text) /
                             double.parse(numEditingController2.text)).toString();
                          }
                        });
                      },
                    ),
                  ],
                ),
          
                TextField(
                  controller: SumResult,
                  decoration: InputDecoration(labelText: "덧셈 결과"),
                  keyboardType: TextInputType.text,
                  readOnly: true,
                ),
                TextField(
                  controller: MinusResult,
                  decoration: InputDecoration(labelText: "뺄셈 결과"),
                  keyboardType: TextInputType.text,
                  readOnly: true,
                ),
                TextField(
                  controller: MultiResult,
                  decoration: InputDecoration(labelText: "곱셈 결과"),
                  keyboardType: TextInputType.text,
                  readOnly: true,
                ),
                TextField(
                  controller: DivideResult,
                  decoration: InputDecoration(labelText: "나눗셈 결과"),
                  keyboardType: TextInputType.text,
                  readOnly: true,
                ),
              ],
            ),
          ),
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

  //결과 계산
  numcalc(BuildContext context) {
    if (numEditingController.text.trim().isEmpty ||
        numEditingController2.text.trim().isEmpty) {
      errorSnackBar(context);
    } else {
      SumResult.text = (int.parse(numEditingController.text) +
              int.parse(numEditingController2.text))
          .toString();
      MinusResult.text = (int.parse(numEditingController.text) -
              int.parse(numEditingController2.text))
          .toString();
      MultiResult.text = (int.parse(numEditingController.text) *
              int.parse(numEditingController2.text))
          .toString();
      DivideResult.text = (double.parse(numEditingController.text) /
              double.parse(numEditingController2.text))
          .toString();
    //스위치 리셋
    setState(() {
    switchsum = true;
    switchminus = true;
    switchmulti = true;
    switchdivide = true;
    });
   
    }
 

  }

// 지우기 기능
  remove(BuildContext context) {
    //결과 지우기 
    SumResult.text = "";
    MinusResult.text = "";
    MultiResult.text = "";
    DivideResult.text = "";
    //스위치 리셋
    setState(() {
    switchsum = true;
    switchminus = true;
    switchmulti = true;
    switchdivide = true;
    });
   
  }
} //end
