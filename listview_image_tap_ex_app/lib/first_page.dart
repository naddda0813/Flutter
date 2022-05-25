
import 'package:flutter/material.dart';
import 'package:listview_image_tap_ex_app/flag_item.dart';

class FirstPage extends StatefulWidget {
  final List<Flag> list; //widget으로 쓰기 위해서
  const FirstPage({Key? key, required this.list}) : super(key: key);  //add final field formal parameter

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context , position) {
            return GestureDetector(
              onTap: () {
                _showAlertDialog(context,position);
              },
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      widget.list[position].imagePath,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 15),
                    Text(" ${widget.list[position].flagKorean[0]}${" _ " *(widget.list[position].flagKorean.length -1)}",
                    style: TextStyle(
                      fontSize: 18
                    ),
                    ),
                  ],
                ),
              ),
            );
          }
          ),
      ),
    );
  }

  //function
  _showAlertDialog(BuildContext context,position) {
    showDialog(
      context: context, 
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text("${widget.list[position].flagEnglish}"),
          content: Text(
            "이 국기는 ${widget.list[position].flagKorean} 입니다.\n"
            "이 나라는 ${widget.list[position].continent}에 속합니다."),
          actions: [
             ElevatedButton(
               onPressed: (){
                  Navigator.of(ctx).pop();
               } ,
                child: const Text("종료"))
          ],
        );
      }
      );
  }

}//end