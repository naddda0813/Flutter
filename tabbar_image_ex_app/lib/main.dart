import 'package:flutter/material.dart';
import 'package:tabbar_image_ex_app/first_page.dart';
import 'package:tabbar_image_ex_app/second_page.dart';

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
       
        primarySwatch: Colors.red,
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

class _MyHomePageState extends State<MyHomePage> 
with SingleTickerProviderStateMixin{

  //property
  late TabController controller;

  //초기값
  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 2,      //tab 갯수 
       vsync: this);    //여기 메인 다트에서
  }

  //위젯이 종료될때 
  @override
  void dispose() {
    controller.dispose();     //super.dispose전에 
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title:  const Text('Tab Bar test'),
      // ),
      body: TabBarView(
        controller: controller,
        children: const [ 
          FirstPage(),SecondPage()    //0번, 1번 
        ],
        ),
        bottomNavigationBar: Container(         //wrap with container
        color: Colors.yellowAccent,
        height: 100,
          child: TabBar(
            controller: controller,
            labelColor: Colors.blueAccent,
            indicatorColor: Colors.red, 
            //indicatorSize:  ,//가리키는탭 
            tabs: const [
              Tab(
                icon: Icon(Icons.looks_one,
                color: Colors.blue,
                ),
              text: "Button"
              ),
              Tab(
                icon: Icon(Icons.looks_two,
                color: Colors.red,
                ),
                 text: "Swipe"
              ),

            ],

       ),
        ),
    );
  }
}