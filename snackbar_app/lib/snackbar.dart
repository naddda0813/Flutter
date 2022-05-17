import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                //build - context
                const SnackBar(
                  content: Text('blue Elevated Button is clicked'),
                  duration: Duration(seconds: 3), //지속시간
                  backgroundColor: Colors.blue,
                ),
              );
            },
            child: const Text('blue Snackbar Button'),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  //build - context
                  const SnackBar(
                    content: Text('pink Elevated Button is clicked'),
                    duration: Duration(seconds: 3), //지속시간 //int만 가능 
                    backgroundColor: Colors.pink,
                  ),
                );
              },
              child: const Text('pink Snackbar Button'),
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
