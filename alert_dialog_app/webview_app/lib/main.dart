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
  String siteName = "www.daum.net";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Center(
          child: Column(
            children: [
              const Text(
                "WebView",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(184, 224, 40, 65))),
                      onPressed: () {
                        //사이트 네임 바꾸기
                        setState(() {
                          siteName = "www.google.com";
                        });
                        _reloadSite();
                      },
                      child: const Text("Google")),
                  //naver
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(184, 30, 159, 13))),
                      onPressed: () {
                        //사이트 네임 바꾸기
                        setState(() {
                          siteName = "www.naver.com";
                        });
                        _reloadSite();
                      },
                      child: const Text("Naver")),
                  //daum
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(184, 43, 40, 224))),
                      onPressed: () {
                        //사이트 네임 바꾸기
                        setState(() {
                          siteName = "www.daum.net";
                        });
                        _reloadSite();
                      },
                      child: const Text("Daum")),
                ],
              )
            ],
          ),
        ),
        toolbarHeight: 100,
      ),
      body: Stack(
        children: [
          WebView(
            //화면
            initialUrl: 'https://$siteName',
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
              return FloatingActionButton(
                  backgroundColor: Colors.redAccent,
                  onPressed: () {
                    controller.data!.goBack(); //데이터가 없을수도 있어서 !
                  },
                  child: const Icon(Icons.arrow_back));
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
