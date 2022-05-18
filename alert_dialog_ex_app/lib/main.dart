import 'package:alert_dialog_ex_app/show_second.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert and push',
        style: TextStyle(fontSize: 35),),
        toolbarHeight: 80,
      ),
      body: Center(
        child: GestureDetector(
          //wrap with widget
          onTap: () => _showDialog(context),
          child: const Text(
            'Halo.\nHave a Good day!',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

//functions
  _showDialog(BuildContext context) {
    showDialog(
        context: context, //buildcontext- contexxt
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Page move'), //제목
            content:
                const Text('Tap under the button ,\nmove second page!',
                style: TextStyle(
                  fontSize: 20,
                ),), //내용
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop(); //보여주고 사라짐
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Second(),
                      ));
                },
                child: const Text('page 이동'),
              ),
            ],
          );
        });
  }
} //end
