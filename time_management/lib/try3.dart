import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Task Manager",
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 8, 12),
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
        body: Row(
          children: [
            // First box with text
            Expanded(
              child: Container(
                color: Colors.blue,
                height: 80,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "Pending Tasks",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // Second box with text
            Expanded(
              child: Container(
                color: Colors.green,
                height: 80,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "Completed Tasks",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}