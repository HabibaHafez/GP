import 'package:flutter/material.dart';
import 'package:techmate/HomeScreens/home.dart';
import 'package:techmate/IntershipsScreen/intershipScreen.dart';
import 'package:techmate/MentorScreen/mentors.dart';
import 'package:techmate/ProfileScreen/profile.dart';
import 'package:techmate/courses/MainCourseScreen.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  BottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.blueGrey,
      selectedItemColor: Colors.blue[800],
      currentIndex: currentIndex,
      onTap: (currentIndex) {
        switch (currentIndex) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CoursesScreen()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InternshipsScreen()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
            break;
          case 3:
            // Navigate to Mentors screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MentorsScreen()),
            );
            break;
          case 4:
            // Navigate to Profile screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
            break;
        }
      },
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
