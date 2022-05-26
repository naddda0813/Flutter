import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  //사이트네임 받기
  final String siteName;
  const WebViewPage({Key? key, required this.siteName}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  //property
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;

  //사이트 네임
  //초기값
  String siteName = "www.daum.net";

  @override
  void initState() {
    super.initState();
    siteName = widget.siteName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
