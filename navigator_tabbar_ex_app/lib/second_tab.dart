import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/animal_item.dart';

class SecondTab extends StatefulWidget {
  final List<Animal> list;
  const SecondTab({Key? key, required this.list}) : super(key: key);

  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  //property
  //late TextEditingController nameController;
  final nameController = TextEditingController();
  int _radioValue = 0; //동물 분류, 디폴트 = 0
  bool flyExist = false; //체크 안한 상태로 싲가
  var _imagePath;
  String imageName = "";

  @override
  void initState() {
    super.initState();
    //nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                maxLines: 1, //최대 한줄
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, //  공간에 맞게 고르게 정렬
                children: [
                  //radio button
                  Radio(
                    value: 0, //시작
                    groupValue: _radioValue,
                    onChanged: _radioChange,
                  ),
                  const Text("영장류"),
                  Radio(
                    value: 1, //가운데
                    groupValue: _radioValue,
                    onChanged: _radioChange,
                  ),
                  const Text("파충류"),
                  Radio(
                    value: 2, //끝
                    groupValue: _radioValue,
                    onChanged: _radioChange,
                  ),
                  const Text("포유류"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('날 수 있나요?'),
                  Checkbox(
                      value: flyExist,
                      onChanged: (check) {
                        //check 변수
                        setState(() {
                          flyExist = check!; //null safety
                        });
                      })
                ],
              ),
              Container(
                height: 100,
                child: ListView(
                  //파일명 다 적어야 함
                  scrollDirection: Axis.horizontal, //가로축으로 움직이기
                  children: [
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/cow.png";
                        setState(() {
                          imageName = "젖소";
                        });
                      },
                      child: Image.asset(
                        "images/cow.png",
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/pig.png";
                        setState(() {
                          imageName = "돼지";
                        });
                      },
                      child: Image.asset(
                        "images/pig.png",
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/bee.png";
                        setState(() {
                          imageName = "벌";
                        });
                      },
                      child: Image.asset(
                        "images/bee.png",
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/cat.png";
                        setState(() {
                          imageName = "고양이";
                        });
                      },
                      child: Image.asset(
                        "images/cat.png",
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/dog.png";
                        setState(() {
                          imageName = "강아지";
                        });
                      },
                      child: Image.asset(
                        "images/dog.png",
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/fox.png";
                        setState(() {
                          imageName = "여우";
                        });
                      },
                      child: Image.asset(
                        "images/fox.png",
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/wolf.png";
                        setState(() {
                          imageName = "늑대";
                        });
                      },
                      child: Image.asset(
                        "images/wolf.png",
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/monkey.png";
                        setState(() {
                          imageName = "원숭이";
                        });
                      },
                      child: Image.asset(
                        "images/monkey.png",
                        width: 80,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(imageName),
              ),
              ElevatedButton(
                  onPressed: () {
                    var animal = Animal(
                        imagePath: _imagePath,
                        animalName: nameController.text,
                        kind: getKind(_radioValue),
                        flyExist: flyExist);

                    AlertDialog dialog = AlertDialog(
                      title: Text("동물 추가하기"),
                      content: Text(
                        //텍스트 하나만 가능
                        "이 동물은 ${animal.animalName} 입니다.\n"
                        "종류는 ${animal.kind} 입니다.\n"
                        "이 동물은 날 수 ${animal.flyExist ? "있습니다." : "없습니다."}\n"
                        "이 동물을 추가 하시겠습니까?",
                        style: const TextStyle(fontSize: 16),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              widget.list.add(animal);
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "예",
                              style: TextStyle(color: Colors.blue),
                            )),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "아니오",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return dialog;
                        });
                  },
                  child: const Text('동물 추가하기')),
            ],
          ),
        ),
      ),
    );
  }

  //function
  _radioChange(int? value) {
    //디폴트가 따로 없어 null safety가 있음
    // 값 세팅
    setState(() {
      _radioValue = value!; //null 빼내기
    });
  }

  //글자 입력 받기
  getKind(int radioValue) {
    //switch 문
    switch (radioValue) {
      case 0:
        return "영장류";
      case 1:
        return "파충류";
      case 2:
        return "포유류";
    }
  }
} //end
