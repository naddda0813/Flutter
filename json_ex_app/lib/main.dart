import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  //property
  late List data;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData(); //json 가져오는 함수
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JSON Movie"),
      ),
      body: Center(
          child: data.isEmpty
              ? const Text("데이터가 없습니다")
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Row(children: [
                      SizedBox(
                          width: 400,
                          child: Card(
                            color: index % 2 == 0
                                ? Colors.yellow
                                : Color.fromARGB(255, 188, 244, 238),
                            child: Column(children: [
                              Row(
                                children: [
                                  Image.network(
                                    data[index]['image'],
                                    height: 140,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    data[index]['title'],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ]),
                          ))
                    ]);
                  })),
    );
  }

  //functtons
  Future<bool> getJSONData() async {
    //비동기
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var reponse = await http.get(url);

    setState(() {
      var dataConvertedJason = json.decode(utf8.decode(reponse.bodyBytes));
      List result = dataConvertedJason["results"];
      data.addAll(result);
    });

    return true;
  }
} //end
