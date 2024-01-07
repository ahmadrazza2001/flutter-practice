import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice/screens/auth/loginScreen.dart';
import 'homeScreen.dart';
import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        AnimatedPositioned(
            top: mq.height * .30,
            left: mq.width * .2,
            width: mq.width * .6,
            duration: const Duration(seconds: 1),
            child: Image.asset('gulambi.png')),
        Positioned(
            bottom: mq.height * .45,
            width: mq.width * 1,
            height: mq.height * .06,
            child: Text(
              'ONLY FOR BOYS (Hehe)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )),
      ]),
    );
  }
}
