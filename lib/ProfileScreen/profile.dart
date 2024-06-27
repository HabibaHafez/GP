import 'package:flutter/material.dart';
import 'package:techmate/BottonNavigationBar/navbar.dart';
import 'package:techmate/HomeScreens/home.dart';
import 'package:techmate/MentorScreen/mentors.dart';
import 'package:techmate/ProfileScreen/Experince.dart';
import 'package:techmate/ProfileScreen/Saved.dart';
import 'package:techmate/ProfileScreen/editprofile.dart';
import 'package:techmate/ProfileScreen/skills.dart';
import 'package:techmate/Notification/notification.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = 'profile screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile' , style: TextStyle(color: Colors.white) ),
      backgroundColor: Colors.blue[800],
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen()),
            );
          },
        ),
      ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://example.com/profile.jpg'), // Replace with actual image URL
            ),
            SizedBox(height: 16),
            Text(
              'Habiba Hafez',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            ListTile(
              leading: Icon(Icons.code, color: Colors.blue[800]),
              title: Text('Skills'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[800]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SkillsScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.work_outline, color: Colors.blue[800]),
              title: Text('Experience'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[800]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExperienceScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.edit_note_outlined, color: Colors.blue[800]),
              title: Text('Edit Profile'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[800]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.save_alt_outlined, color: Colors.blue[800]),
              title: Text('Saved'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[800]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SavedScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.blue[800]),
              title: Text('Log Out'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[800]),
              onTap: () {
                // Handle log out
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4, 
      ),
    );
  }
}
