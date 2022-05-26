import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_tabbar_app/webview.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //property
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;
  //사이트 네임
  //초기값
  String siteName = "";
  //tabbar
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "WebView",
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          WebViewPage(siteName: "www.naver.com"),
          WebViewPage(siteName: "www.google.com"),
          WebViewPage(siteName: "www.daum.net"),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.yellow[200],
        child: TabBar(
            controller: tabController,
            indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 7, color: Colors.tealAccent),
                insets: EdgeInsets.symmetric(horizontal: 30.0)),
            labelColor: Colors.black87,
            tabs: [
              Tab(
                icon: Image.asset(
                  "images/naver.png",
                  width: 40,
                  height: 40,
                ),
                text: "네이버",
              ),
              Tab(
                icon: Image.asset(
                  "images/google.png",
                  width: 40,
                  height: 40,
                ),
                text: "구글",
              ),
              Tab(
                icon: Image.asset(
                  "images/daum.png",
                  width: 40,
                  height: 40,
                ),
                text: "다음",
              ),
            ]),
      ),
    );
  }

  //functions
  _reloadSite() {
    _controller.future.then((value) => value.loadUrl("https://$siteName"));
  }
} //end
