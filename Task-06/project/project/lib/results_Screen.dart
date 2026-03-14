import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class result_Screen extends StatelessWidget {
  const result_Screen({
    super.key,
    required this.girl,
    // required this.name,
    required this.age,
    required this.weight,
    required this.height,
    required this.result
  });

  final bool? girl;
  // final String name;
  final int age;
  final int weight;
  final int height;
  final String result;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: girl == true ? Color(0xFFFFAFD2) : Color(0xf94e91f1),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(girl==true ? "Here's Your Result, Beautiful❤️" : "Here's Your Result", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),

              _infoRow("Age", "$age years"),
              _infoRow("Weight", "$weight kg"),
              _infoRow("Height", "$height cm"),
              Text("----------------------", style: TextStyle(fontSize: 18, color: Colors.grey)),
              _resultRow(result)
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 18, color: Colors.grey)),
          Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

Widget _resultRow( String value) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("BMI : ", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
        Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
