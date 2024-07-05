import 'package:flutter/material.dart';
import 'package:techmate/StudentUser/BottonNavigationBar/navbar.dart';
import 'package:techmate/ProfileScreen/profile.dart';
import 'package:techmate/StudentUser/HomeScreens/home.dart';
import 'package:techmate/StudentUser/MentorScreen/mentors.dart';
import 'MainCourseScreen.dart';
import 'package:techmate/StudentUser/IntershipsScreen/intershipScreen.dart';

class CourseDetailsScreen extends StatelessWidget {
  static const String routeName = 'courseDetailsScreen';
  final String courseTitle = 'python';

  // CourseDetailsScreen({required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          courseTitle,
          style: TextStyle(color: Colors.white),
        ),
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                    image: DecorationImage(
                      image: AssetImage('images/your_image.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: Icon(
                        Icons.play_circle_filled,
                        color: Colors.white,
                        size: 64,
                      ),
                      onPressed: () {
                        // Handle play button action
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Course Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'This course provides an in-depth understanding of data analysis using SQL.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Instructor: John Doe',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Number of Sessions: 12',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Price: \$99.99',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            SizedBox(height: 16),
            Text(
              'Course Content:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.play_circle_outline),
                  title: Text('Session ${index + 1}: Introduction to SQL'),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}