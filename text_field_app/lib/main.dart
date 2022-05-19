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
  late TextEditingController textEditingController; //class, instance

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      FocusScope.of(context).unfocus();
      },
      child :  Scaffold(
        appBar: AppBar(
        title: const Text('Single Text field'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                labelText: "글자를 입력하세요"      //글자 안내 
              ),
              //keyboardType: TextInputType.number,   //숫자만 입략받음 
              keyboardType: TextInputType.text,   //글자만 입략받음 
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed:() {
                // 사용자의 입력 내용 확인
                // 입력확인
                if(textEditingController.text.trim().isEmpty) {   //  공백제거 - trim 
                  errorSnackBar(context);
                } else {
                  showSnackBar(context);
                }
              }, 
            child: const Text("출력"))
          ],
        ),
      ),
      ),
    );
  }

 // function
  showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
       content: Text('입력한 글자는 ${textEditingController.text} 입니다'),
       duration: const Duration(seconds: 2),
       backgroundColor: Colors.blue,
       )
   );
  }

//desc : 텍스트 필드에 입력을 안하고 버튼을 눌렸을 경우 
 errorSnackBar(BuildContext context) {
   ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(
       content: Text('글자를 입력하세요'),
       duration: Duration(seconds: 2),
       backgroundColor: Colors.red,
       )
   );
 }



}// end