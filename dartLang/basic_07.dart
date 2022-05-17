main() {
  checkVersion();
  print("End process");
}

Future checkVersion() async{    // 비동기 함수
  var version = await lookupVersion();  //다른 것이 끝나야 출력 가능 
  print(version);
}

int lookupVersion() {
  return 12;
}





