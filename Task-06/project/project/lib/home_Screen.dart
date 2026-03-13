import 'package:flutter/material.dart';
import 'package:project/results_Screen.dart';

class home_Screen extends StatefulWidget {
  const home_Screen({super.key});

  @override
  State<home_Screen> createState() => _home_Screen_state();
}

class _home_Screen_state extends State<home_Screen> {
  bool? girl;
  int age = 0;
  int weight = 0;
  int height = 0;
  // String name = "";

  // final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white), textAlign: TextAlign.center,),
        backgroundColor: girl == true ? Color(0xFFFFAFD2) : (girl == false ? Color(0xf94e91f1) : Color(0xFFB3B3B3)),
      ),
      backgroundColor: girl == true ? Color(0xFFFFAFD2) : (girl == false ? Color(0xf94e91f1) : Color(0xFFB3B3B3)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            width: 300,
            child: Text(
              girl == null
                  ? "Let's Start Shall We?"
                  : (girl == true ? "let's go Girl ! 🥳❤️" : "ok, I guess..🙄"),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    girl = true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: girl == true ? Color(0xFFFF3D94) : Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [
                        Image.asset(
                          "assets/hairstyle.png",
                          height: 50,
                          color: girl != true
                              ? Color(0xFFB3B3B3)
                              : Colors.white,
                        ),
                        Text(
                          "FEMALE",
                          style: TextStyle(
                            color: girl != true
                                ? Color(0xFFB3B3B3)
                                : Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  setState(() {
                    girl = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: girl == false ? Color(0xF9295CA3) : Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [
                        Image.asset(
                          "assets/man.png",
                          height: 50,
                          color: girl == false
                              ? Colors.white
                              : Color(0xFFB3B3B3),
                        ),
                        Text(
                          "MALE",
                          style: TextStyle(
                            color: girl == false
                                ? Colors.white
                                : Color(0xFFB3B3B3),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                // TextField(
                //   controller: _nameController,
                //   onChanged: (value) => setState(() => name = value),
                //   decoration: InputDecoration(
                //     labelText: "Name",
                //     filled: true,
                //     fillColor: Colors.white,
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //   ),
                // ),

                SizedBox(height: 15),

                TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      setState(() => age = int.tryParse(value) ?? 0),
                  decoration: InputDecoration(
                    labelText: "Age",
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      setState(() => weight = int.tryParse(value) ?? 0),
                  decoration: InputDecoration(
                    labelText: "Weight (kg)",
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      setState(() => height = int.tryParse(value) ?? 0),
                  decoration: InputDecoration(
                    labelText: "Height (cm)",
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => result_Screen(
                    girl: girl,
                    // name: name,
                    age: age,
                    weight: weight,
                    height: height,
                  )),
                );
              },
              color: girl == true ? Color(0xFFFF3D94) :(girl == false ? Color(0xF9295CA3) : Color(
                  0xFF575757)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              child: Text(
                "Continue",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
