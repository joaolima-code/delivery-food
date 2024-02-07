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
        appBar: AppBar(
          title: Text("initial"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(color: Colors.blue)));
  }
}
