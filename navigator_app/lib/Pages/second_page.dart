import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          Navigator.pop(context);   //pop으로 사라지기 
        }, 
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red)
,        ),
        child: const Text('go to the first page'),
        ),
      ),
    );
  }
}