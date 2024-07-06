// import 'package:flutter/material.dart';
// import 'package:techmate/MentorUser/ChatScreen.dart';
// import 'package:techmate/MentorUser/MentorHome.dart';
// import 'package:techmate/MentorUser/mentorprofile.dart';
// class BottomNavBar extends StatelessWidget {
//   final int currentIndex;
//
//   BottomNavBar({required this.currentIndex});
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       unselectedItemColor: Colors.blueGrey,
//       selectedItemColor: Colors.blue[800],
//       currentIndex: currentIndex,
//       onTap: (currentIndex) {
//         switch (currentIndex) {
//           case 0:
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MentorHome()),
//             );
//             break;
//           case 1:
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ChatScreen()),
//             );
//             break;
//           case 2:
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MentorProfileScreen()),
//             );
//             break;
//         }
//       },
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.school_outlined), // Updated icon for Courses
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.business_outlined), // Updated icon for Internships
//           label: 'Chat',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home_outlined), // Updated icon for Home
//           label: 'Profile',
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:techmate/MentorUser/ChatScreen.dart';
import 'package:techmate/MentorUser/MentorHome.dart';
import 'package:techmate/MentorUser/mentorprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MessageListScreen.dart';


class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  BottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.blueGrey,
      selectedItemColor: Colors.blue[800],
      currentIndex: currentIndex,
      onTap: (currentIndex) async {
        final mentorId = await getNationalId();
        final senderId = await _getSenderId();

        switch (currentIndex) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MentorHome(),
              ),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MessageListScreen(mentorId: mentorId!),
              ),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MentorProfileScreen(),
              ),
            );
            break;
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.school_outlined), // Updated icon for Courses
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business_outlined), // Updated icon for Internships
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), // Updated icon for Home
          label: 'Profile',
        ),
      ],
    );
  }

  // Function to get National ID
  Future<int?> getNationalId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('national_id');
  }

  Future<int?> _getSenderId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('national_id');
  }
}
