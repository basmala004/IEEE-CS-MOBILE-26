import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(0.8),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
                itemBuilder: (context, index)=>
                ListTile(
                  leading: IconButton(onPressed: (){}, icon: Icon(Icons.check_box, color: Colors.grey,) ),
                  title: Row(
                    children: [
                      Text('task', overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,)),
                      const SizedBox(width: 20,),
                    ]
                  ),
                  subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('5:50 PM', style: TextStyle(color: Colors.grey, fontSize: 17),),
                        Text('Dec 13 2026', style: TextStyle(color: Colors.grey, fontSize: 17),),
                    ]
                    ),

                ),
                separatorBuilder: (context, index)=> Divider(indent: 50, endIndent: 50,),
                itemCount: 15
            ),
          )
        ]
      ),
    );
  }
}
