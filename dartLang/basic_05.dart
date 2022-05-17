 main() {
  //function
  //java - method 
  List<int> list1 = [1,3,5,6,9];
  
  List<int> list2 = [10,30,50,60,90];

  // function 만들기
  addList(List list) {      //_ 는 private, 없으면 public 
  int sum = 0 ; 
  for(int i in list){
    sum +=i;
  }
  print("합계 : $sum " );
  }

  addList(list1);
  addList(list2);

int addList2(List list) {      //_ 는 private, 없으면 public 
  int sum = 0 ; 
  for(int i in list){
    sum +=i;
  }
  return sum;
  }
  int result1 =addList2(list1);
  int result2 =addList2(list2);
  print(result1);
  print(result2);

}