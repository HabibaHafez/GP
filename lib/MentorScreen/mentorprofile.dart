import 'package:flutter/material.dart';
import 'package:techmate/BottonNavigationBar/navbar.dart';
import 'package:techmate/HomeScreens/home.dart';
import 'package:techmate/ProfileScreen/profile.dart';
import 'bookmeeting.dart';
import 'mentors.dart';
import 'package:techmate/Notification/notification.dart';
import 'package:techmate/Chats/Mentorchat.dart';


class MentorProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentor Profile', style: TextStyle(color: Colors.white)),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage('https://example.com/mentor_image.jpg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'John Smith',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Tech Enthusiast & Mentor',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      'Experienced in Web Development, UI/UX Design',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Bio',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'A passionate tech mentor dedicated to helping individuals learn and grow in the tech industry.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Experience',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '5 years of experience in Web Development\n3 years of experience in UI/UX Design',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SelectDateTimeScreen()),
                        );
                      },
                      child: Text(
                        'Book Meeting',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3, 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MentorChatScreen(),
              ),
            );
          },

        child: Icon(Icons.message, color: Colors.white,),
        backgroundColor: Colors.blue[800],

      ),
    );
  }
}
