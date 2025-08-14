import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Scaffold(
      appBar: AppBar(
        title: Text("Task Manager"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 147, 227, 241),
      ),
    )
  ));
}