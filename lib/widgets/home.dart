import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie app"),),

      // In Flutter plural and singular can indicate what is expected as component
        // child (singular) -> one component expected (Container, SingleChildScrollView, Padding...)
        // children (plural) -> one or more component expected (Row,Column, Stack)
      body:Column(
        children: [
          Row(
            children: [
              TextField(decoration: InputDecoration(hintText: "Enter movie to search"),),
              TextButton(onPressed: (){}, child: Text("Search"))
            ],
          )
        ],
      )
    );
  }
}
