import 'dart:convert';

import 'package:crud_all_result_app/delete_page.dart';
import 'package:crud_all_result_app/insert_page.dart';
import 'package:crud_all_result_app/update_page.dart';
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
          title: const Text("CRUD for Students"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context , 
                  MaterialPageRoute(
                    builder: (context) => const Insert(),));
              }, icon: Icon(Icons.add) ) 
          ],
        ),
        body: Center(
            child: data.isEmpty //data = > list
                ? const Text("데이터가 없습니다") //데이터 없을때
                : ListView.builder(
                    //있을때
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      //index 순서
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => Update(
                                code: data[index]['code'], name:  data[index]['name'],
                                 dept: data[index]['dept'], phone: data[index]['phone'], input: data[index]['code']))
                                 ).then((value) => rebuild());
                        }, 
                        onLongPress: () {
                           Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => Delete(
                                code: data[index]['code'], name:  data[index]['name'],
                                 dept: data[index]['dept'], phone: data[index]['phone']),
                            ),
                            ).then((value) => rebuild()) ;
                        },
                        child: SizedBox(
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

  
    return true;
  }

  //functions 
  rebuild() {
    setState(() {
      data =[];
      getJSONData();
    });
  }

} //end
