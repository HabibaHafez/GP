import 'package:flutter/material.dart';
import 'package:techmate/HomeScreens/home.dart';
import 'package:techmate/IntershipsScreen/intershipScreen.dart';
import 'package:techmate/MentorScreen/mentors.dart';
import 'package:techmate/ProfileScreen/profile.dart';
import 'package:techmate/courses/MainCourseScreen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex; // Add currentIndex as a parameter

  CustomBottomNavigationBar({required this.currentIndex});

  @override
  _CustomBottomNavigationBarState get createState =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex, // Use the provided currentIndex
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.school,
            color: widget.currentIndex == 0 ? Colors.blue[800] : Colors.grey,
          ),
          label: 'Courses',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.work,
            color: widget.currentIndex == 1 ? Colors.blue[800] : Colors.grey,
          ),
          label: 'Internships',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: widget.currentIndex == 2 ? Colors.blue[800] : Colors.grey,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.people,
            color: widget.currentIndex == 3 ? Colors.blue[800] : Colors.grey,
          ),
          label: 'Mentor',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: widget.currentIndex == 4 ? Colors.blue[800] : Colors.grey,
          ),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.blue[800],
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true, // Show labels for selected icons
      showUnselectedLabels: true, // Show labels for unselected icons
      onTap: (index) {
        switch (index) {
          case 0:
            // If already on the "Courses" screen, do nothing
            if (widget.currentIndex == 0) return;
            Navigator.pushReplacementNamed(context, CoursesScreen.routeName,
                arguments: 0); // Pass currentIndex as argument
            break;
          case 1:
            // If already on the "Internships" screen, do nothing
            if (widget.currentIndex == 1) return;
            Navigator.pushReplacementNamed(context, InternshipsScreen.routeName,
                arguments: 1); // Pass currentIndex as argument
            break;
          case 2:
            // If already on the "Home" screen, do nothing
            if (widget.currentIndex == 2) return;
            Navigator.pushReplacementNamed(context, HomeScreen.routeName,
                arguments: 2); // Pass currentIndex as argument
            break;
          case 3:
            // If already on the "Mentor" screen, do nothing
            if (widget.currentIndex == 3) return;
            Navigator.pushReplacementNamed(context, MentorsScreen.routeName,
                arguments: 3); // Pass currentIndex as argument
            break;
          case 4:
            // If already on the "Profile" screen, do nothing
            if (widget.currentIndex == 4) return;
            Navigator.pushReplacementNamed(context, ProfileScreen.routeName,
                arguments: 4); // Pass currentIndex as argument
            break;
        }
      },
    );
  }
}
