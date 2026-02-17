import 'dart:io';

bool tidyNumber(n) {
  bool istidy=true;
  while (n/10 != 0 ){
    if ((n%10)<((n/10)%10))  istidy= false;
  }
  return istidy;
}

void main(){
  int n= int.parse(stdin.readLineSync().toString());
  print(tidyNumber(n));
}