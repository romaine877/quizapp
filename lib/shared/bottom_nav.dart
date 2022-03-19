import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.university),
          label: 'Topics',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.addressCard),
          label: 'About',
        ),
      ],
      onTap: (int index) {
       
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/profile');
            
            break;
          case 1:
            break;
          case 2:
            Navigator.pushNamed(context, '/about');
            break;
        }
      },
    );
  }
}
