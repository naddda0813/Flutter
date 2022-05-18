import 'package:flutter/material.dart';

class ReceivedMail extends StatelessWidget {
  const ReceivedMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Received Mail'),
         backgroundColor: Colors.red[400],
         actions: [
          IconButton(
            onPressed: () {
            Navigator.pushNamed(context, '/SendMail');
          }, icon: Icon(Icons.mail_lock_rounded),
          ),
          IconButton(
            onPressed: () {
            Navigator.pushNamed(context, '/ReceivedMail');
          }, icon: Icon(Icons.mail_outline_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 70, 0, 0),
        child: Column(
          children: [
          Row(
            children: [
              Text(
              '유비에게 온 메일',
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.check_box),
        ),
            ],
          ),
        Row(
          children: [
            Text(
              '관우에게 온 메일',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.check_box),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '장비에게 온 메일',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.check_box),
            ),
          ],
        ),
          ],
        ),
      ), 
    );
  }
}