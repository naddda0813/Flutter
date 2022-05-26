import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;
  //사이트 네임
  //초기값
  String siteName = "www.daum.net";
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        toolbarHeight: 100,
        actions: [
          //검색 아이콘
          IconButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  //넣어줄 때 공백 빼기
                  siteName = controller.text.trim();
                  //보여줄때도 공백 빼기
                }
                _reloadSite();
              },
              icon: Icon(Icons.search))
        ],
        title: SizedBox(
          width: 300,
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: "Site 이름을 입력하세요",
            ),
            keyboardType: TextInputType.text,
            maxLines: 1, //최대 한줄
            autocorrect: false, //자동완성 막기
          ),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            //화면
            initialUrl: 'https://${siteName}',
            javascriptMode: JavascriptMode.unrestricted, //제한없이
            //화면구성
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            //페이지 끝나면
            //인디케이터
            onPageFinished: (finish) {
              setState(() {
                // 로딩 멈추기
                isLoading = false;
              });
            },
            //페이지 시작하면
            //인디케이터
            onPageStarted: (start) {
              setState(() {
                //로딩 하기
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              //true면 indicator
              : Stack(), //false
        ],
      ),
      //floatingactionbutton
      //back

      floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            if (controller.hasData) {
              //controller가 데이터가 있으면
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                      backgroundColor: Colors.redAccent,
                      onPressed: () {
                        controller.data!.goBack(); //데이터가 없을수도 있어서 !
                      },
                      child: const Icon(Icons.arrow_back)),
                  FloatingActionButton(
                      backgroundColor: Colors.orangeAccent,
                      onPressed: () {
                        controller.data!.reload(); //데이터가 없을수도 있어서 !
                      },
                      child: const Icon(Icons.replay)),
                  FloatingActionButton(
                      backgroundColor: Colors.indigo,
                      onPressed: () {
                        controller.data!.goForward(); //데이터가 없을수도 있어서 !
                      },
                      child: const Icon(Icons.arrow_forward)),
                ],
              );
            }
            return Stack();
          }),
    );
  }

  //functions
  _reloadSite() {
    _controller.future.then((value) => value.loadUrl("https://$siteName"));
  }
} //end
