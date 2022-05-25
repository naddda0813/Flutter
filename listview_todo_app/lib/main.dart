import 'package:flutter/material.dart';
import 'package:listview_todo_app/view/insert_list.dart';
import 'package:listview_todo_app/view/table_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     routes: {
       "/" : (context) => const TableList(),
       "/insert" :(context) => const InsertList(),
       },
       initialRoute: "/",       //처음 실행하는 페이지 
    );
  }
}

