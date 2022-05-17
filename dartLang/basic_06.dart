 main() {
  ThreeKingdoms threeKingdoms = ThreeKingdoms();
  print(threeKingdoms.name);
  threeKingdoms.sayName();

  ThreeKingdoms2 threeKingdoms2 = ThreeKingdoms2("유비", "촉");
   threeKingdoms2.saySomething();
  } //main

//class
  class ThreeKingdoms{
    //field
    String name = '유비';
    //constructor

    //method or function
    sayName() {
        print("내 이름은 ${this.name}  입니다.");
    }
  }
  //출력하는 class
  class ThreeKingdoms2 {
    //field 
    late String name; // 후에 넣기 
    String? nation;   //null safety

    // constructor
    ThreeKingdoms2(String name, String nation)
    :this.name = name,
    this.nation = nation;

    // method
    saySomething(){
      print('제 이름은 ${this.name}이고 조국은 ${this.nation} 입니다.');
    }
  }