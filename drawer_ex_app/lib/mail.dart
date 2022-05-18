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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
              ),
            accountName: Text('Pikachu'),
            accountEmail: Text('pikachu@gmail.com'),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
            ),
          ListTile(     //개당 하나씩 
          onTap: () {
            Navigator.pushNamed(context, '/SendMail');
          },
          leading: 
          Icon(Icons.mail_lock_rounded,
          color: Colors.blue[300],
          ),
          title: Text('보낸 메일함'),
          ),
          ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/ReceivedMail');
           },
          leading: 
          Icon(Icons.mail_outline_rounded,
          color: Colors.red[300],
          ),
          title: Text('받은 메일함'),
        )
          ],
        ),
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
