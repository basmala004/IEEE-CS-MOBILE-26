import 'package:flutter/material.dart';

class home_Screen extends StatefulWidget {
  const home_Screen({super.key});

  @override
  State<home_Screen> createState() => _home_Screen_state();
}

class _home_Screen_state extends State<home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA4FADA),
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [

                ]
              ),
              Column()
            ],
          )
        ],
      )
    );
  }

}