import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Welcome to Task Manager",
            style: TextStyle(
              color: const Color.fromARGB(255, 26, 43, 202),
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 6, 169, 233),
                  const Color.fromARGB(255, 217, 221, 233),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
