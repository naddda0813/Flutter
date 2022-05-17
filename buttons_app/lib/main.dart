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
        //backgroundColor: Colors.orange,
        appBar: AppBar(
          title: const Text('Buttons'),
          //backgroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(     //테두리가 안 보임 
                  onPressed: () {
                    //onclick 과 같음
                    print("Text button"); // console  창
                  },
                  onLongPress: () {
                    print("Long pressed text button"); //어플 출시할때는 없애야함
                  },
                  child: const Text(
                    'Text Button', //출력할 버튼 내용
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.red,
                  )),
              ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
                    //circular : 최대 20
                child: const Text(
                  'Elevated Button',
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  //
                },
                style: OutlinedButton.styleFrom(
                    primary: Colors.green,
                    side: const BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    )),
                child: const Text(
                  'Outlined Button',
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  //
                },
                icon: const Icon(
                  Icons.home,
                  size: 30,
                ),
                label: const Text("Go to home"),
                style: TextButton.styleFrom(
                  primary: Colors.purple,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  //
                },
                icon: const Icon(
                  Icons.home,
                  size: 20,
                ),
                label: const Text('home'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  minimumSize: const Size(200, 40),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  //
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                label: const Text('Go to Home'),
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        //onclick 과 같음
                      },
                      child: const Text(
                        'Text Button',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.blue,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        //
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: const Text(
                        'Elevated Button',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
