import 'dart:io';

void main(){
  //Problem 1: 
  double temp=10.2;
  print("Temprature is $temp in Celsius, While being ${temp*9/5 +32} in Fahrenheit ");

  print("");
  //Problem 2:
  String s= "100.0";
  double d= double.parse(s);
  int i= d.toInt();
  print("String: '${s}'");
  print("Double: ${d}");
  print("Int: ${i}");



  print("");
  //Problem 3:
  print("Enter your name ......");
  var input= stdin.readLineSync();
  String name= input.toString();
  String h= "HELLOOOOOO!!!";

  String concat = h + " " +name;

  int len= concat.length;
  String sub= concat.substring(0,5);
  String up= concat.toUpperCase();
  String low= concat.toLowerCase();

  print("String 1: $h");
  print("String 2: $name");
  print("Concat: $concat");
  print("Length: $len");
  print("Substring: $sub");
  print("LoWer case: $low");
  print("Upper case: $up");



  print("");
  //Problem 4: 
  print("please enter a string.......");
  var pal= stdin.readLineSync();
  String str= pal.toString();
  int l=0, r=str.length-1;
  bool ispal = true;
  while(l<r){
    if(str[l] != str[r]) ispal = false;
    l++; r--;
  }
  if(ispal) print("The string $str IS A PALINDROME!!");
  else print("The string $str IS NOT A PALINDROME!!");

}
