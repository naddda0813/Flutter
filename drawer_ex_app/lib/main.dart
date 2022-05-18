import 'package:drawer_ex_app/mail.dart';
import 'package:drawer_ex_app/received_mail.dart';
import 'package:drawer_ex_app/send_mail.dart';
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
      "/" :(context) => const Mail(),
      "/SendMail" : (context) => const SendMail(),
      "/ReceivedMail" : (context) => const ReceivedMail(),
    },
    );
  }
}

