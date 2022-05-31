import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Property
  late TextEditingController codecontroller;
  late TextEditingController namecontroller;
  late TextEditingController deptcontroller;
  late TextEditingController phonecontroller;
  
  late String code;
  late String name;
  late String dept;
  late String phone;
  late String result;   //결과 

  //초기값
  @override
  void initState() {
    super.initState();
    codecontroller = TextEditingController();
    namecontroller = TextEditingController();
    deptcontroller = TextEditingController();
    phonecontroller = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insert & Return for CRUD"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
            TextField(
              controller: codecontroller,
              decoration: const InputDecoration(
                labelText: "학번을 입력하세요",
              ),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: namecontroller,
              decoration: const InputDecoration(
                labelText: "성명을 입력하세요",
              ),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: deptcontroller,
              decoration: const InputDecoration(
                labelText: "전공을 입력하세요",
              ),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: phonecontroller,
              decoration: const InputDecoration(
                labelText: "휴대폰번호를 입력하세요",
              ),
              //숫자만 입력받기
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                code = codecontroller.text;
                name = namecontroller.text;
                dept = deptcontroller.text;
                phone = codecontroller.text;
                insertAction();
              },
             child: const Text("입력"),),
            ],
          ),
        ),
      ),
    );
  }

  //--Functions
  // 입력하였을 때
  // 비동기
  insertAction() async{
    //jsp 연결
    var url = Uri.parse(
    "http://localhost:8080/Flutter/student_insert_return_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone"
    );
    //실행 
    var response = await http.get(url);
    setState(() {
      //json setting
      var dataCovertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataCovertedJSON['result'];
    
      if(result == "OK") {
        _showDialog(context);
      } else{
      errorSnackBar(context);
      }
    });
  }

//dialog
_showDialog(BuildContext context) {
 showDialog(
   context: context, 
   builder: (BuildContext context){
     return AlertDialog(
       title: const Text("입력결과"),
       content: const Text("입력이 완료되었습니다"),
       actions: [
         TextButton(
           onPressed: () {
             Navigator.of(context).pop();
           },
          child: const Text("OK"),),
       ],
     );
   });
   
}
//errorsnackbar
errorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("사용자 정보 입력에 문자가 발생하였습니다."),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
      )
  );

}

} //end

