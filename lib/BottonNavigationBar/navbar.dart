import 'package:flutter/material.dart';



class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  BottomNavBar({required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.blueGrey,
      selectedItemColor: Colors.blue[800],
      currentIndex: currentIndex,
      onTap: onTap,
      items: const <BottomNavigationBarItem>[


        BottomNavigationBarItem(
          icon: Icon(Icons.school_outlined), // Updated icon for Courses
          label: 'Courses',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business_outlined), // Updated icon for Internships
          label: 'Internships',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), // Updated icon for Home
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_alt_outlined), // Updated icon for Mentors
          label: 'Mentors',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline), // Updated icon for Profile
          label: 'Profile',
        ),
      ],
    );
  }
}
