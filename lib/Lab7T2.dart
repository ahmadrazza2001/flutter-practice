import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_provider.dart';

class Lab7T2 extends StatefulWidget {
  @override
  _Lab7T2State createState() => _Lab7T2State();
}

class _Lab7T2State extends State<Lab7T2> {
  String loggedInUsername = "";
  String userRole = "";
  String userCampus = "";

  @override
  void initState() {
    super.initState();
    _loadLoggedInUserInfo();
  }

  void _loadLoggedInUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? "";
    String role = prefs.getString('role') ?? "";
    String campus = prefs.getString('campus') ?? "";

    setState(() {
      loggedInUsername = username;
      userRole = role;
      userCampus = campus;
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
          "USER INFO",
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
          children: [
            Text(
              "Logged in as: $loggedInUsername",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Role: $userRole",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Campus: $userCampus",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
