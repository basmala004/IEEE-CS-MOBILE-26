import 'dart:io';

String getMiddle(String s) {
  //Code goes here!
  int mid= (s.length/2).toInt();
  if(s.length %2 ==0) return s.substring(mid - 1, mid + 1);
  else return s[mid];
}


void main(){
  String s= stdin.readLineSync().toString() ;
  print(getMiddle(s));
}