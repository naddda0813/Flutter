import 'package:flutter/material.dart';
import 'package:navigator_cllass_app/screen.dart';
import 'package:navigator_cllass_app/screen1st.dart';
import 'package:navigator_cllass_app/screen2nd.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' :(context) => const Screen(),       //class 이름 //기본 시작 홈페이지 
        '/1st' :(context) => const Screen1st(),
        '/2nd' :(context) {
          return const Screen2nd();
        }
      },
      initialRoute: '/',    // 초기화면 설정  , Screen
    );
  }
}

