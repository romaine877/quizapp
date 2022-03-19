import 'package:flutter/material.dart';
import 'package:quizapp/screens/login.dart';
import 'package:quizapp/screens/topics.dart';
import 'package:quizapp/services/auth.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return const TopicsScreen();
          } else if (snapshot.hasError) {
            return const Text('Error');
          } else {
            return const LoginScreen();
          }
        });
  }
}
