import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/services/auth.dart';
import 'package:quizapp/widgets/login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const FlutterLogo(
              size: 100,
            ),
            LoginButton(
              icon: FontAwesomeIcons.accessibleIcon,
              color: Colors.blue,
              text: 'Login',
              loginMethod: AuthService().anonSignIn,
            ),
            LoginButton(
              icon: FontAwesomeIcons.google,
              color: Colors.indigo,
              text: 'Login',
              loginMethod: AuthService().googleSignIn,
            ),
          ]),
    );
  }
}
