import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text('신난 피카츄!'),
        elevation: 0, //그림자 없애기
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
            label: Text('go to the first Page'),
          ),
          Image.asset(
            'images/pikachu-1.jpg',
            width: 300,
            height: 300,
          ),
        ],
      )),
    );
  }
}
