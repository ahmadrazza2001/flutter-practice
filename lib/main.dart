import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice/Lab7.dart';
import 'package:practice/Lab7T2.dart';

import 'package:practice/page2.dart';
import 'package:practice/LoginForm.dart';
import 'user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
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
            "MAD Tasks",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            _buildCard(FontAwesomeIcons.bookOpen, "Lab-5", Page2(), context),
            _buildCard(
                FontAwesomeIcons.signInAlt, "Login", LoginForm(), context),
            _buildCard(FontAwesomeIcons.android, "Lab-7 T1", Lab7(), context),
            _buildCard(FontAwesomeIcons.android, "Lab-7 T2", Lab7T2(), context),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      IconData icon, String label, Widget route, BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Builder(
        builder: (BuildContext context) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => route),
              );
            },
            child: Container(
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
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    size: 60,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
