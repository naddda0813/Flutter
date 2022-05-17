 main() {
  int? num1 = null;
  print(num1);
  num1 ??= 8;  //띄어쓰기 유의
  //num1 이 null이면 8 대입 
  print(num1);

  //삼항 연산자 
  bool isPublic = true;
  var visivility = isPublic ? 'public' : 'private';
  print(visivility);

  //for
  int sum = 0;
  for(int i=1; i <=10;i++){
    sum += i ; 
  }
  print(sum);

sum = 0 ; 
List<int> numList = [1,2,5,6,8];
for(int i in numList) {
  sum+=i;
}
  print(sum);

}