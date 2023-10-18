import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "DICEBOX",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.white.withOpacity(0.5),
                        child: const Text("First Row - 1st Item"),
                      ),
                      SizedBox(width: 20),
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.white.withOpacity(0.5),
                        child: const Text("First Row - 2nd Item"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.white.withOpacity(0.5),
                        child: const Text("Second Row - 1st Item"),
                      ),
                      SizedBox(width: 20),
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.white.withOpacity(0.5),
                        child: const Text("Second Row - 2nd Item"),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 50,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('1.jpg'),
                      fit: BoxFit.cover,
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
}
