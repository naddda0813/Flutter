import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          //center는 child만 가능
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/1st');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text('Go to the screen #1'),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: ElevatedButton(
                //mainAxisAlignment: MainAxisAlignment.center,
                onPressed: () {
                  Navigator.pushNamed(context, '/2nd');
                },
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Text('Go to the screen #2'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
