import 'package:flutter/material.dart';

class SendMail extends StatelessWidget {
  const SendMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: const Text('Send Mail'),
         backgroundColor: Colors.green[500],
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
            children: const [
              Text(
              '유비에게 보낸 메일',
              style: TextStyle(
                fontSize: 20,
              ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.check_box),
        ),
            ],
          ),
        Row(
          children: const [
            Text(
              '관우에게 보낸 메일',
               style: TextStyle(
                fontSize: 20,
              ),
            ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.check_box),
              ),
          ],
        ),
        Row(
          children: const [
            Text(
              '장비에게 보낸 메일',
               style: TextStyle(
                fontSize: 20,
              ),
            ),
              Padding(
                padding: EdgeInsets.all(8.0),
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