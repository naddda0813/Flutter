main() {
  //  화면 출력
  print('Hello World!');

  //변수선언
  String name = "Kim";
  var name1 = "Kim";
  var intNum1 = 1;
  dynamic name2 = "Lee";    //문자, 숫자 
  name1 ="Lee";
  name2 = 20;

  //정수
  int int1 = 30;
  int int2 = 20;
  
  print(int1/int2);   //실수 
  print(int1%int2);   //나머지
  print(int1 ~/int2); //몫 

  // 문자열
  String str1 = '유비';
  String str2 = '장비';
  
  print(str1 + ":" +str2);    //java
  //문자열 보관법
  print("$str1:$str2");

  //합계 
  print("$int1 + $int2"); 
  print("${int1 + int2}");  //{}로 묶어야 계산식 완성 

}