import 'package:flutter/material.dart';
import 'package:naviagator_lamp_app/message.dart';
import 'package:naviagator_lamp_app/modify_page.dart';

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
  late TextEditingController controller;    //글자입력
  late String imageName;    //이미지 
  late bool switchOnOff;     //스위치
  late String lighting;       //글입력 

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    imageName = Message.imageName;
    switchOnOff = Message.switchOnOff;
    lighting =Message.lighting;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("main 화면"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => 
                  Modify(text: controller.text, 
                  lighting: switchOnOff,)))
                  .then((value) => rebuild(value));

            }, icon: Icon(Icons.edit))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "글자를 입력하세요"
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 200,
              child: Image.asset(imageName)),
          ],
        ),
      ),
    );
  }

rebuild(value) {
  print(value[2]); 
  setState(() {
    controller.text = value[0];
    imageName = value[1];
    if(value[2] == false) {  //switch
      switchOnOff = false;
    } else {
       switchOnOff = true;
    }

  });
}


}





