import 'package:flutter/material.dart';

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

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar Icon'),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black87,
        toolbarHeight: 70,
        //appbar 앞에 하나만 아이콘 하나만 가능
        leading: IconButton(
          onPressed: () {
            //
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          //list라 여러개가능 ,오른쪽 정렬
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.add_alarm),
          ),
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.add_outlined),
          ),
          GestureDetector(
            onTap: () {        //이미지를 누르면 주는 action
              //
            },
            child: Image.asset(
              'images/smile.png',
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
