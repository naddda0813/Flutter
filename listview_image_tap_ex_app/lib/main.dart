import 'package:flutter/material.dart';
import 'package:listview_image_tap_ex_app/first_page.dart';
import 'package:listview_image_tap_ex_app/flag_item.dart';
import 'package:listview_image_tap_ex_app/second_page.dart';

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
  late TabController controller;  // 탭컨트롤러
  List<Flag> flagList =[];

  //초기화 
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    flagList.add(
      Flag(
        imagePath: "images/austria.png",
         flagKorean: "오스트리아", 
         flagEnglish: "Austria",
         continent: "유럽"
         )
    );
    flagList.add(
      Flag(
        imagePath: "images/belgium.png",
         flagKorean: "벨기에", 
         flagEnglish: "Belgium",
         continent: "유럽"
         )
    );
    flagList.add(
      Flag(
        imagePath: "images/france.png",
         flagKorean: "프랑스", 
         flagEnglish: "France",
         continent: "유럽"
         )
    );
    flagList.add(
      Flag(
        imagePath: "images/germany.png",
         flagKorean: "독일", 
         flagEnglish: "Germany",
         continent: "유럽")
    );
    flagList.add(
      Flag(
        imagePath: "images/hungary.png",
         flagKorean: "헝가리", 
         flagEnglish: "Hungary",
         continent: "유럽")
    );
    flagList.add(
      Flag(
        imagePath: "images/italy.png",
         flagKorean: "이탈리아", 
         flagEnglish: "Italy",
         continent: "유럽")
    );
    flagList.add(
      Flag(
        imagePath: "images/lithuania.png",
         flagKorean: "리투아니아", 
         flagEnglish: "Lithuania",
         continent: "유럽")
    );
  }
  //컨트롤러 작동끄기
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("국가명 맞추기"),
      ),
      body: TabBarView(
          controller: controller,
          children: [
            FirstPage(list:flagList),
            SecondPage(list:flagList),
          ],
      ),
      bottomNavigationBar: Container(
        color:Colors.pink[100],
        height: 70,
        child: TabBar(
          controller: controller,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 10,color: Colors.pinkAccent ),
            insets: EdgeInsets.symmetric(horizontal: 30.0)
          ),
          labelColor:Colors.black87,
          tabs: const [
            Tab(
              icon: Icon(Icons.looks_one,
              color: Colors.blue,
              ),
              text: "List",
            ),
            Tab(
              icon: Icon(Icons.looks_two,
              color: Colors.red,
              ),
            ),
          ],
          ),
      ),
    );
  }

}//end