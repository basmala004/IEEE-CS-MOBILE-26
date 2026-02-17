

import 'dart:io';

int potatoes(int p0, int w0, int p1) {
   int ans= (w0 - (w0-((100-p0)/(100-p1)*w0))).toInt();
   return ans;

}

void main(){
  int p0= int.parse(stdin.readLineSync().toString());
  int w0= int.parse(stdin.readLineSync().toString());
  int p1= int.parse(stdin.readLineSync().toString());
  print (potatoes(p0, w0, p1));
}