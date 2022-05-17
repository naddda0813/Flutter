import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        title: Text('기분 좋은 피카츄!'),
        //elevation: 0,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.home_filled),
            label: Text('go to the Pikachu page'),
          ),
          Image.asset(
            'images/pikachu-2.jpg',
            width: 300,
            height: 300,
          ),
        ],
      )),
    );
  }
}
