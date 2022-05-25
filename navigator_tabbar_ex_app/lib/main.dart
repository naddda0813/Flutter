import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/home.dart';

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
      home: const MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  //property
  late TextEditingController controllerID;
  late TextEditingController controllerPW;

  @override
  void initState() {
    super.initState();
    controllerID = TextEditingController();
    controllerPW = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(
              Icons.account_circle,
              size: 100,
            ),
            //id
            TextField(
              controller: controllerID,
              decoration: InputDecoration(labelText: "사용자 ID를 입력하세요."),
              keyboardType: TextInputType.text,
            ),
            //pw
            TextField(
              controller: controllerPW,
              decoration: InputDecoration(labelText: "패스워드를 입력하세요."),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _showLogin(context);
                },
                child: const Text("Log In"))
          ],
        ),
      ),
    );
  }

 

  _showLogin(BuildContext context) {
    if (controllerID.text.isEmpty || controllerPW.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('사용자 ID와 PW를 입력하세요.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ));
    } 
    else if (controllerID.text.trim() != "root" || controllerPW.text.trim() != "1234") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("사용자 ID 또는 PW가 일치하지 않습니다"),
        duration: Duration(seconds: 2),
      ));
    } 
    else if (controllerID.text.trim() == "root" && controllerPW.text.trim() == "1234") {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: Text("환영합니다"),
              content: Text("신분이 확인되었습니다."),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      //탭이 있는home.dart로 보내기 
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const MyHome(),
                          ));
                    },
                    child: const Text("OK"))
              ],
            );
          });
    }
  }
} //end
