import 'package:bmi_app/calc.dart';
import 'package:bmi_app/result.dart';
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
      routes: {
        "/" :(context) => const Calc(),
       "/Result": (context) => const Result(),
      },
      debugShowCheckedModeBanner : false,
    );
  }
}

                                                                        