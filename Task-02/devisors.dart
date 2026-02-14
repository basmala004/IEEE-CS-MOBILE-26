import 'dart:io';

List<int> devisors(int n){
  List<int> dev= [];

  for (int i=1; i*i<=n; i++){
    if(n % i ==0) {
      dev.add(i);
      if (i*i != n) dev.add((n/i).toInt());
    }
  }

  dev.sort();
  return dev;

}



void main(){
  print("Please enter a number......");

  int? n= int.parse(stdin.readLineSync().toString());
  List<int> dev = devisors(n);

  print(dev);

}