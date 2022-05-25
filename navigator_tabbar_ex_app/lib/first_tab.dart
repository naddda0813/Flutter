import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/animal_item.dart';

class FirstTab extends StatefulWidget {
  final List<Animal> list;
  const FirstTab({Key? key, required this.list}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  //property

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: widget.list.length, //animal list의 갯수
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: () {
                  _showAlertDialog(context, position);
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
                      Text(
                        "         ${widget.list[position].animalName}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  //function
  _showAlertDialog(BuildContext context, position) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text("${widget.list[position].animalName}"),
          content: Text(
            "이 동물은 ${widget.list[position].kind}  입니다.",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("종료"))
          ],
        );
      },
    );
  }
} //end
