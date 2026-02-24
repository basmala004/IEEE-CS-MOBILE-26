void main(List<String> args) {

  Undergraduate ug = Undergraduate();
  ug.RegNumber=1111111;
  ug.Name=fullname("Mohamed", "Ahmed", "Mohamed");
  ug.Marks=[96, 82, 74];


  Postgraduate pg = Postgraduate();
  pg.RegNumber=2222222;
  pg.Name=fullname("Sarah", "Ali", "Ahmed");
  pg.Marks=[92, 88, 54];

  ug.printInfo();
  pg.printInfo();
  
}

abstract class studentevent {
  double calcGPA();
  void printInfo();
}

class fullname{
  String firstname =" ";
  String middlename =" ";
  String lastname =" ";
  
  fullname( this.firstname,  this.middlename, this.lastname);

  String get Fullname => "$firstname $middlename $lastname";  
}


abstract class Student {
  int regnum = 0;
  fullname name=fullname("", "", "");
  List<double> marks = [];

  set RegNumber(int id) => regnum = id;
  set Name(fullname n) => name = n;
  set Marks(List<double> m) => marks = m;

  int get RegNumber => regnum;
  fullname get Name => name;
  List<double> get Marks => marks;
  }



class Undergraduate extends Student implements studentevent {
  @override

  double calcGPA() {
  double totalPoints = 0;
  for (double mark in marks) {
    if (mark >= 95) totalPoints += 12;
    else if (mark >= 90) totalPoints += 11.5;
    else if (mark >= 85) totalPoints += 11;
    else if (mark >= 80) totalPoints += 10;
    else if (mark >= 75) totalPoints += 9;
    else if (mark >= 70) totalPoints += 8;
    else if (mark >= 65) totalPoints += 7;
    else if (mark >= 60) totalPoints += 6;
    else if (mark < 50) totalPoints += 0;
    }
    return totalPoints / (marks.length * 3);
  }

  @override
  void printInfo() {
    print("\nUndergraduate Student: ");
    print("ID: $regnum");
    print("Name: ${name.Fullname}");
    print("Marks: $marks");
    print("GPA: ${calcGPA() .toStringAsFixed(2)}");
  }
}



class Postgraduate extends Student implements studentevent {
  @override
  double calcGPA() {
    double totalPoints = 0;
    
    for (double mark in marks) {
      if (mark >= 90) totalPoints += 12;
      else if (mark >= 85) totalPoints += (32 / 3);
      else if (mark >= 80) totalPoints += (31 / 3);
      else if (mark >= 75) totalPoints += 10;
      else if (mark >= 70) totalPoints += (22 / 3);
      else if (mark >= 65) totalPoints += 7;
      else if (mark >= 60) totalPoints += 6;
      else if (mark >= 56) totalPoints += 5;
      else if (mark >= 53) totalPoints += 4;
      else if (mark >= 50) totalPoints += 3;
      else totalPoints += 0;
    }
    return totalPoints / (marks.length * 3);
  }

  @override
  void printInfo() {
    print("\nPostgraduate Student: ");
    print("ID: $regnum");
    print("Name: ${name.Fullname}");
    print("Marks: $marks");
    print("GPA: ${calcGPA().toStringAsFixed(2)}");
  }
}