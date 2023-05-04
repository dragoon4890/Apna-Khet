import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newkhet/login.dart';
import 'package:newkhet/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ApnaKhet',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/home': (context) => SingleChildScrollView(child: Home()),
      },
      home: const LoginPage(),
    );
  }
}
