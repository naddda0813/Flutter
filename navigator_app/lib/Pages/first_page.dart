import 'package:flutter/material.dart';
import 'package:navigator_app/Pages/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(             //second page 보내기 
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondPage(), //하나일 때 fatarrow, 여러개일때 {}
                ));
          },
          child: const Text('go to the second page'),
        ),
      ),
    );
  }
}
