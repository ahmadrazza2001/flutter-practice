import 'package:flutter/material.dart';

class Lab7 extends StatefulWidget {
  @override
  _Lab7State createState() => _Lab7State();
}

class _Lab7State extends State<Lab7> {
  String message = "Press the button below";

  void showMessage() {
    setState(() {
      if (message == "Ahmad") {
        message = "Ali";
      } else {
        message = "Ahmad";
      }
    });
  }

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
          "Lab-7 Task-1",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: showMessage,
              child: Text("Greeting Button"),
            ),
          ],
        ),
      ),
    );
  }
}
