

import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.red,
      ),
      body:Center(
        child: const Text('today is windy day',
        style: TextStyle(fontSize: 35,
        fontWeight: FontWeight.w500),),
      ),
    );
  }
}