import 'package:flutter/material.dart';
import 'package:techmate/BottonNavigationBar/navbar.dart';
import 'package:techmate/HomeScreens/home.dart';
import 'package:techmate/ProfileScreen/profile.dart';
import 'mentorprofile.dart';


class MentorsScreen extends StatelessWidget {
  static const String routeName = 'mentor screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find a Mentor', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to notifications page
              // Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsScreen()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Filter', style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Rating', style: TextStyle(fontWeight: FontWeight.bold,color :Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Track', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for mentors',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Replace with your actual count of mentors
              itemBuilder: (context, index) {
                // Replace with mentor's actual data
                final mentorData = [
                  {
                    'name': 'John Smith',
                    'title': 'Software Engineer',
                    'reviews': '908 reviews',
                    'rating': 9.1,
                    'image': 'https://example.com/mentor_image.jpg',
                  },
                  {
                    'name': 'Jane Doe',
                    'title': 'Data Analyst',
                    'reviews': '420 reviews',
                    'rating': 8.6,
                    'image': 'https://example.com/mentor_image.jpg',
                  },
                  {
                    'name': 'Michael Johnson',
                    'title': 'Frontend Developer',
                    'reviews': '811 reviews',
                    'rating': 8.2,
                    'image': 'https://example.com/mentor_image.jpg',
                  },
                ];

                final mentor = mentorData[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(mentor['image'] as String),
                  ),
                  title: Text(mentor['name'] as String),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(mentor['title'] as String),
                      Text(mentor['reviews'] as String),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MentorProfileScreen(),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.message),
                        onPressed: () {
                          // Navigate to chat screen specific to this mentor

                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
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
    );
  }
}