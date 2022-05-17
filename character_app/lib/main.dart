import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('영웅 card'),
        backgroundColor: Color.fromARGB(255, 222, 91, 15),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/Lee.jpg'),
                  radius: 50,
                ),
              ),
            ),
            const Divider(
              height: 10,
              color: Colors.grey,
              thickness: 0.5,
            ),
            Text('성웅',
                style: TextStyle(
                  color: Colors.white,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('이순신 장군',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Text(
              '전적',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '62전 62승',
                style: TextStyle(
                  color: Color.fromARGB(227, 195, 57, 16),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Icon(Icons.event_seat),
                Text(
                  ' 옥포해전',
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.event_seat),
                Text(
                  ' 사천포해전',
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.event_seat),
                Text(
                  ' 당포해전',
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.event_seat),
                Text(
                  ' 한산도해전',
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.event_seat),
                Text(
                  ' 부산포해전',
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.event_seat),
                Text(
                  ' 명량해전',
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.event_seat),
                Text(
                  ' 노량해전',
                ),
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/turtle.gif"),
                backgroundColor: Colors.orange,
                radius: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
