import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spence/pages/mainpage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
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
      home: Mainpage(),
    );
  }
}
