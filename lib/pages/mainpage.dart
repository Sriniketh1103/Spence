import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spence/pages/homepage.dart';
import 'package:spence/pages/loginpage.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Optional: Show a loading spinner while waiting for the stream
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // User is signed in
        if (snapshot.hasData) {
          return const HomePage();
        }

        // User is NOT signed in
        return const LoginPage();
      },
    );
  }
}
