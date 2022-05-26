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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("JSON Test"),
        ),
        body: Center(
            child: data.isEmpty //data = > list
                ? const Text("데이터가 없습니다") //데이터 없을때
                : ListView.builder(
                    //있을때
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      //index 순서
                      return SizedBox(
                        height: 150,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Code : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data[index]['code'],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Name : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data[index]['name'],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Dept : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data[index]['dept'],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Phone : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data[index]['phone'],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })));
  }

  //functions
  Future<bool> getJSONData() async {
    //비동기함수
    var url = Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');
    var reponse = await http.get(url);

    setState(() {
      //한글도 같이 디코딩
      var dataConvertedJason = json.decode(utf8.decode(reponse.bodyBytes));
      //result를 제외하고 데이터만 가져오기
      List result = dataConvertedJason["results"];
      //result를 다 넣기
      data.addAll(result);
    });

    // print(result);
    // print(result[0]);
    // print(result[0]['code']);
    // print(result[0]['name']);
    //print(data[0]['code']);
    return true;
  }
} //end
