import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice/screens/splashScreen.dart';
import 'package:provider/provider.dart';
// import 'screens/homeScreen.dart';
// import 'package:practice/screens/auth/loginScreen.dart';

//global object for accessing device screen size
late Size mq;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) {
    Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyD1mo9bCOta5HbgRxaNur7hBmlNPGf3u0M",
        authDomain: "practice-2dbc0.firebaseapp.com",
        projectId: "practice-2dbc0",
        storageBucket: "practice-2dbc0.appspot.com",
        messagingSenderId: "618661166601",
        appId: "1:618661166601:web:c06479d5eff3500f79c2d8",
      ),
    );
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
        // primarySwatch: Colors.pink,
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 2,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
            backgroundColor: Colors.white),
      ),
      home: SplashScreen(),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Colors.deepPurple,
//                 Colors.purple,
//                 Colors.blue,
//               ],
//             ),
//           ),
//         ),
//         title: const Text(
//           "MAD Tasks",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 24,
//           ),
//         ),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         children: <Widget>[
//           // _buildCard(FontAwesomeIcons.bookOpen, "Lab-5", Page2()),
//           // _buildCard(FontAwesomeIcons.signInAlt, "Login", LoginForm()),
//           // _buildCard(FontAwesomeIcons.android, "Employees", Lab7()),
//           //_buildCard(FontAwesomeIcons.android, "Lab-7 T2", Lab7T2()),
//           // _buildCard(FontAwesomeIcons.newspaper, "News API", NewsTab()),
//         ],
//       ),
//     );
//   }

//   Widget _buildCard(IconData icon, String label, Widget route) {
//     return Builder(
//       builder: (context) {
//         return Card(
//           elevation: 4,
//           margin: EdgeInsets.all(10),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => route,
//                 ),
//               );
//             },
//             child: Hero(
//               tag: label, // Unique tag for each card
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       Colors.deepPurple,
//                       Colors.purple,
//                       Colors.blue,
//                     ],
//                   ),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Icon(
//                       icon,
//                       size: 60,
//                       color: Colors.white,
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       label,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
