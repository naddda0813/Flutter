
import 'package:bmi_tap_app/message.dart';
import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  State<Calc> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Calc> 
with SingleTickerProviderStateMixin{

// property
late TabController controller;
late TextEditingController height;    //키 입력 
late TextEditingController weight;    //몸무게 입력
late double bmiCalc;
late String calcresult;
late String isObesity;
late String image;

@override
  void initState() {
    super.initState();
    height = TextEditingController();
    weight = TextEditingController();
    bmiCalc = 0 ;
    calcresult = "";
    isObesity = "";
    image = "images/bmi2.png"; //image
    controller = TabController(
      length: 2,    //tab 갯수 
      vsync: this);
  }

    //위젯이 종료될때 
  @override
  void dispose() {
    controller.dispose();     //super.dispose전에 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 234, 211),
      appBar: AppBar(
        title: Text('BMI 계산'),
        backgroundColor: Colors.indigo,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(25, 50, 25, 30),
                  child: Text('운동을 시작해볼까요?',
                  style: TextStyle(
                    fontSize: 35,
                  ),),
                ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: height,
                  decoration: InputDecoration(
                    labelText : "키를 입력하세요",
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 3, color: Colors.amber),
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                   keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  controller:weight,
                  decoration: InputDecoration(
                    labelText : "몸무게를 입력하세요",
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 3, color: Colors.amber),
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  calcBMI(context);
                  rating(context);
                  Navigator.pushNamed(context,"/Result");
                }
                , child: const Text('계산 하기'),),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(calcresult,
                  style: const TextStyle(
                    fontSize: 16,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(isObesity,
                  style: const TextStyle(
                    fontSize: 30,
                  ),),
                ),
              
              ],
            ),
          ),
        ),
      ),
    );
  }

//빈값을 입력할 때 에러스낵바 
errorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("숫자를 확인하세요"),
    duration: Duration(seconds: 1),
    backgroundColor: Colors.red,)
    );
}

//잘못된 값을 입력할때 미스스낵바
missSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("범위를 벗어난 값입니다."),
    duration: Duration(seconds: 1),
    backgroundColor: Colors.greenAccent,
    )
    );
}



// 에러 스낵바와 미스스낵바 
calcBMI(BuildContext context) { 
  if (weight.text.trim().isEmpty | height.text.trim().isEmpty  ) {
    errorSnackBar(context);
  } else if (int.parse(weight.text) <= 0 || int.parse(weight.text) >=500 
  ||  int.parse(height.text) <=0 || int.parse(height.text)  >= 300  ) {
    missSnackBar(context);
  }
     else {
      
 setState(() {
  bmiCalc = (double.parse(weight.text) / ((double.parse(height.text) *0.01) * (double.parse(height.text) *0.01)));
    Message.calcresult = "나의 체질량 지수 \n$bmiCalc ";
    });
    
   } 
}

rating(BuildContext context)  {
if(bmiCalc > 10 && bmiCalc <= 18.4) {
  Message.isObesity = "저체중\n체중관리가 필요합니다.";
  Message.image ="images/bmi1.png";
} else if(bmiCalc > 18.4 && bmiCalc <=22.9) {
  Message.isObesity = "정상체중\n유지가 필요합니다.";
  Message.image ="images/bmi2.png";
} else if (bmiCalc > 22.9 && bmiCalc <= 24.9) {
  Message.isObesity = "과체중\n체중관리가 필요합니다.";
  Message.image ="images/bmi3.png";
} else if (bmiCalc > 24.9 && bmiCalc <= 29.9) {
  Message.isObesity = "비만\n체중관리가 필요합니다.";
  Message.image ="images/bmi4.png";
} else if (bmiCalc > 29.9) {
  Message.isObesity = "고도비만\n체중관리가 필요합니다.";
  Message.image ="images/bmi5.png";
} else {
  Message.isObesity = "계산하기 어려운 수치입니다."; 
}

  }




}// end