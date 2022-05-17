import 'package:flutter/material.dart';
import 'package:navigator_2_app/pages/second_page.dart';
import 'package:navigator_2_app/pages/third_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 234, 203, 155),
        appBar: AppBar(
          title: const Text(
            'Pikachu',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondPage(),
                      ));
                },
                icon: const Icon(
                  Icons.monitor_heart_rounded,
                  size: 30,
                ),
                label: const Text(
                  '신난 피카츄 보러가기', //second page
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 40),
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThirdPage(),
                      ));
                },
                icon: Icon(Icons.phone_android),
                label: const Text(
                  '기분 좋은 피카츄 보러가기', //thirdpage
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 40),
                ),
              ),
            ),
          ],
        )));
  }
}
