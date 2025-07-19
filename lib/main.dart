import 'package:flutter/material.dart';
import 'package:spence/pages/homepage.dart';
import 'package:spence/pages/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'calsans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF72988B),
          primary: Color(0xFF72988B),
        ),
        primaryColor: Color(0xFF72988B),
      ),
      home: LoginPage(),
    );
  }
}
