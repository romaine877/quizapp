import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function loginMethod;
  final IconData icon;

  const LoginButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.loginMethod,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton.icon(
        onPressed: () {
          
          loginMethod();
        },
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        label: Text(text),
        style: TextButton.styleFrom(
            padding: const EdgeInsets.all(24), backgroundColor: color),
      ),
    );
  }
}
