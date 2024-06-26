import 'package:flutter/material.dart';
import 'bookmeeting.dart';
import '../Profile/profile.dart';
import '../Home/home.dart';
import 'mentors.dart';
import 'package:home/navbar.dart';

class MentorProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentor Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
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
        currentIndex: 3, // Set the current index for the active item
        onTap: (index) {
          // Handle navigation based on index
          switch (index) {
            case 0:

              break;
            case 1:
            // Navigate to Internships screen (if necessary)
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              break;
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle FAB press
        },
        child: Icon(Icons.message),
        backgroundColor: Colors.blue[800],
      ),
    );
  }
}
