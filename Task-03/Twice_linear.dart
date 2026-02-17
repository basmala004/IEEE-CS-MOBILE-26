import 'dart:io';

int dblLinear(int n) {
  List<int> arr=[1];

  for(int i=0; i<n*2; i++){
    arr.add((arr[i]*2)+1);
    arr.add((arr[i]*3)+1);
    arr.sort();
  }



  return arr[n];
}


void main() {
  int n=int.parse(stdin.readLineSync().toString());
  print(dblLinear(n));
}