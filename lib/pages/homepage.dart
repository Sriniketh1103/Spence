import 'package:flutter/material.dart';
import 'package:spence/services/authservices/googlesignin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Home Page!'),
            ElevatedButton(
              onPressed:  ()  async {
               await GoogleSignInService.signOut();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
