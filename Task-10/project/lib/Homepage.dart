import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            // custom app bar..
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      fillColor: Colors.grey[100],
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 10),
                  child: Icon(Icons.menu),
                ),
              ],
            ),

            Container(height: 30),

            // categories section
            Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            Container(height: 20),

            Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.home, size: 40),
                        padding: EdgeInsets.all(15),
                      ),
                      Text("home", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),


                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.home, size: 40),
                        padding: EdgeInsets.all(15),
                      ),
                      Text("home", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),


                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.home, size: 40),
                        padding: EdgeInsets.all(15),
                      ),
                      Text("home", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),


                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.home, size: 40),
                        padding: EdgeInsets.all(15),
                      ),
                      Text("home", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
