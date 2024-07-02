import 'package:flutter/material.dart';
import 'package:techmate/RecruiterUser/Home/RecruiterProfile.dart';
import 'package:techmate/RecruiterUser/Home/recruiterHome.dart';
import 'package:techmate/StudentUser/HomeScreens/home.dart';
import 'package:techmate/StudentUser/IntershipsScreen/intershipScreen.dart';
import 'package:techmate/StudentUser/MentorScreen/mentors.dart';
import 'package:techmate/ProfileScreen/profile.dart';
import 'package:techmate/StudentUser/courses/MainCourseScreen.dart';

class RecruiterBottomNavBar extends StatelessWidget {
  final int currentIndex;

  RecruiterBottomNavBar({required this.currentIndex});

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
              MaterialPageRoute(builder: (context) => RecruiterInternshipsScreen()),
            );
            break;

          case 1:
          // Navigate to Profile screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RecruiterProfileScreen()),
            );
            break;
        }
      },
      items: const <BottomNavigationBarItem>[

        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), // Updated icon for Home
          label: 'Home',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline), // Updated icon for Profile
          label: 'Profile',
        ),
      ],
    );
  }
}
