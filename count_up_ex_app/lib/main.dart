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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  late int count; 

  @override
  void initState() {
    count = 0; 
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('count up & down '),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('현재 클릭수는 $count입니다.'),
            FloatingActionButton(
              onPressed: (){
                setState(() {
                  count ++ ;
                });
              },
                backgroundColor: Colors.amber,
              child :Row(
                children: const [
                  Icon(Icons.add),
                SizedBox(
                width: 20,
              ),
                ],
              ),
              ),
            FloatingActionButton(
              onPressed: (){
                setState(() {
                  count -- ;
                });
              },
              child :Row(
                children: const [
                  Icon(Icons.remove),
                SizedBox(
                width: 20,
              ),
                ],
              ),
              ),
              
          ],
        ),
      ),
    );
  }
}