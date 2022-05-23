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
  //property
  late String _lampImage; //image name
  late String _lampOnOffStaus; // image onoff staus

  @override
  void initState() {
    // 초기값
    super.initState();
    _lampImage = "images/lamp_on.png";
    _lampOnOffStaus = "On";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('alert를 이용한 메시지 출력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 650,
              child: Image.asset(_lampImage),
            ),
            ElevatedButton(
                onPressed: () {
                  _showAlertOnDialog(context); //alert on 일때 보여주는 경고창
                },
                child: Text("켜기")),
            ElevatedButton(
                onPressed: () {
                  _showAlertOffDialog(context);
                },
                child: Text("끄기")),
          ],
        ),
      ),
    );
  }

  //function

  _showAlertOnDialog(BuildContext context) {
    if (_lampOnOffStaus == 'On') {
      //켜진 상태일 때 켜기 누르기 
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('경고'),
              content: const Text('현재 램프가 켜진 상태 입니다.'),
              actions: [
                TextButton(
                    onPressed: () {
                      _lampImage = "images/lamp_on.png";
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('네. 알겠습니다.'))
              ],
            );
          });
    } else {
      //전구 꺼짐 상태 일때 켜기 누르면 켜기 
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('램프 끄기'),
              content: const Text('램프를 켜시겠습니까?'),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _lampImage = "images/lamp_on.png";
                      _lampOnOffStaus = "On";
                    });
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('네'),
                ),
                TextButton(
                  onPressed: () {
                     Navigator.of(ctx).pop();
                  },
                  child: const Text('아니오'),
                ),
              ],
            );
          });
    }
  } // alert on  dialog - end



  _showAlertOffDialog(BuildContext context) {
    if (_lampOnOffStaus == 'Off') {
      //꺼져있을 때 끄기 누르면 경고창
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('경고'),
              content: const Text('현재 램프가 꺼진 상태 입니다.'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('네. 알겠습니다.'))
              ],
            );
          });
    } else {
      //꺼져 있을 때 켜기 누르기 
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('램프 끄기'),
            content: const Text('램프를 끄시겠습니까?'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _lampImage = "images/lamp_off.png";
                    _lampOnOffStaus = "Off";
                  });
                  Navigator.of(ctx).pop();
                },
                child: const Text('네'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('아니오'),
              ),
            ],
          );
        },
      );
    }
  } // alert off  dialog -end

} //end
