main() {
  List threeKingdoms = [];
  //추가 
  threeKingdoms.add("위");
  threeKingdoms.add("촉");
  threeKingdoms.add("오");

  //출력
  print(threeKingdoms);
  print(threeKingdoms[0]);
  print(threeKingdoms[1]);
  print(threeKingdoms[2]);

  //수정
  threeKingdoms[0] = "We";

  //행렬 지정하여 삭제
  threeKingdoms.removeAt(1);
  //내용 지정하여 삭제 
  threeKingdoms.remove("We");

  //갯수
  print(threeKingdoms.length);
  threeKingdoms.add(1); //dynamic = type이 따로 지정되지 않아 숫자도 가능
  print(threeKingdoms);

  List<String> threeKingdoms2 = []; //string만 가능 
  //threeKingdoms2.add(1);  //불가

  //---
  // Map : Key와 Value로 이루어진 collection
    Map fruit = {     //key = apple , value =사과
      'apple' : '사과',
      'grape' : '포도',
      'orange' : '오렌지',
    };
  print(fruit['apple']);
  //  수정 
  fruit['orange'] = "달콤한 오렌지";
  print(fruit);
  //추가 
  fruit['banana']  ='바나나';
  print(fruit);
  
  Map<String, int> fruitsPrice = {
    'apple' : 1000,
    'grape' : 2000,
    'orange' : 3000,
  };
  print(fruitsPrice);
  print(fruitsPrice['apple']);
  int applePrice = fruitsPrice['apple']!; //!를 넣어 null이 아니라고 지정

  //null safety
  int numA = 10;
  int? numB  = 100;   //null 수용
  numB = null; 
  print(numB);

}