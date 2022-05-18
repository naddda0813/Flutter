import 'package:flutter/material.dart';

class Mail extends StatelessWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator_AppBar'),
        backgroundColor: Colors.blue,
        toolbarHeight: 75,
        //icon 앱바의 왼쪽
        leading: IconButton(
          onPressed: () {
            //
          },
          icon: Icon(Icons.menu),
        ),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/SendMail');
              },
              icon: Icon(Icons.mail_lock_rounded),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green[500]),
              ),
              label: const Text('보낸 메일함'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/ReceivedMail');
                },
                icon: Icon(Icons.mail_outline_rounded),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red[400]),
                ),
                label: const Text('받은 메일함'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
