
import 'dart:io';

int Quadrants(int x, int y){
  if(x>0){
    return y>0? 1 : 4;
  }else{
    return y>0? 2 : 3;
  }
}


void main(){
  int x=int.parse(stdin.readLineSync().toString());
  int y=int.parse(stdin.readLineSync().toString());
  
  print(Quadrants(x, y));
}