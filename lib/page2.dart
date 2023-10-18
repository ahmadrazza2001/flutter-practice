import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  // Sample data for the students and their roll numbers.
  final List<Map<String, dynamic>> students = [
    {"name": "Ahmad Raza", "rollNo": "024"},
    {"name": "Sharjeel Hussain", "rollNo": "013"},
    {"name": "Samad Yar Babar", "rollNo": "019"},
    {"name": "Muhammad Ali", "rollNo": "007"},
    {"name": "Bilal Khattak", "rollNo": "060"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepPurple,
                Colors.purple,
                Colors.blue,
              ],
            ),
          ),
        ),
        title: const Text(
          "PAGE 2",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: ListTile(
                title: Text(students[index]["name"]),
                subtitle: Text("Roll No: ${students[index]["rollNo"]}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
