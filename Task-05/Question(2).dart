// import 'dart:io';

void main(List<String> args) {
 

  Client newClient= Client(name: "Ali Mohamed Nabil", num: 991316);
  bank_account acc1= bank_account(acc_num: "73740192", acc_type: "Current", balance: 25000, curruncy: "EGP");
  bank_account acc2= bank_account(acc_num: "73700438", acc_type: "Saving", balance: 1800, curruncy: "USD");
  newClient.add_account(acc1);
  newClient.add_account(acc2);
  newClient.accounts[0].deposit(1500);
  newClient.accounts[1].withdraw(5000);
  newClient.accounts[1].withdraw(300);

  newClient.printData();
}



class bank_account{
  String? acc_num="";
  String? acc_type="";
  int balance=0;
  String? curruncy="";

  bank_account({required this.acc_num, required this.acc_type, required this.balance, required this.curruncy});

  void deposit(int amount) {
    balance += amount;
  }

  void withdraw(int amount){
    amount>balance? print("withdrawl denied deu to lack of balance"): balance-=amount;
  }

  void printAccInfo(){
    print("Account number : $acc_num");
    print("Account type : $acc_type");
    print("Balance : $balance $curruncy \n");
  }
}




class Client{
  int? num;
  String? name;
  List<bank_account> accounts=[];

  Client({required this.name,required this.num});

  void add_account(bank_account acc) => accounts.add(acc);

  void printData(){
    print("Client number : $num");
    print("Client name : $name");
    print("Accounts Details: \n \n");
    if(accounts.isEmpty) print("\n No accounts yet");
    else {
      for(bank_account acc in accounts){
        acc.printAccInfo();
      }
    }
  }
}



































 //was trying smth :)

/*
  print("Please enter client's name: ");
  String name= stdin.readLineSync()?? " ";
  print("Please enter client's number: ");
  int num= int.parse(stdin.readLineSync().toString());
  
  Client newClient= Client(name: name, num: num);

  print("How many account do you want to add? ");
  int n = int.parse(stdin.readLineSync().toString());
  for(int i=0; i<n; i++){
    print("Accoutn number ${i+1}");
    print("Please enter account's number: ");
    String accnum= stdin.readLineSync()?? " ";
    print("Please enter account's Type: ");
    String type= stdin.readLineSync()?? " ";
    print("Please enter account's balance: ");
    int balance= int.parse(stdin.readLineSync().toString());
    print("Please enter used currency: ");
    String currency= stdin.readLineSync()?? " ";

    bank_account acc = bank_account(acc_num: accnum, acc_type: type, balance: balance, curruncy: currency);
    newClient.add_account(acc);
  }

  bool loop = true;
  while(loop==true){
    print("Choose  Acount: ");
    int account = int.parse(stdin.readLineSync().toString());
    print("1. Deposit \n 2. Withdraw \n 3. Print Data \n 4. Finish");
    int choice = int.parse(stdin.readLineSync().toString());
    switch(n){
      case 1:
        print("Enter the amount you want to deposite");
        int amount = int.parse(stdin.readLineSync().toString());
        newClient.accounts[account-1].deposit(amount);
        break;
      case 2:
        print("Enter the amount you want to withdraw");
        int amount = int.parse(stdin.readLineSync().toString());
        newClient.accounts[account-1].withdraw(amount);
        break;
      case 3:
        newClient.printData();
        break;
      case 4:
        return;
    }
  }

  newClient.printData();
*/