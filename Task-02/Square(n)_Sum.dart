

import 'dart:io';

int squareSum(List<int> numbers) {
  var sum=0;
  for(int i=0; i<numbers.length; i++) sum+= numbers[i]*numbers[i];
  return sum;
}



void main(){
  int n= int.parse(stdin.readLineSync().toString());
  List<int> arr= [];
  for(int i=0; i<n; i++) arr.add(int.parse(stdin.readLineSync().toString()));
  print(squareSum(arr)); 
}