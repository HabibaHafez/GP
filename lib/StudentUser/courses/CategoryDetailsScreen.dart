import 'package:flutter/material.dart';
import 'package:techmate/StudentUser/BottonNavigationBar/navbar.dart';
import 'package:techmate/StudentUser/Chats/Track_Chat.dart';
import 'package:techmate/StudentUser/IntershipsScreen/intershipScreen.dart';
import 'package:techmate/ProfileScreen/profile.dart';
import 'package:techmate/StudentUser/HomeScreens/home.dart';
import 'package:techmate/StudentUser/MentorScreen/mentors.dart';
import 'package:techmate/StudentUser/courses/MainCourseScreen.dart';
import 'package:techmate/StudentUser/BottonNavigationBar/navbar.dart';

class CourseCategoryScreen extends StatelessWidget {
  static const routeName = 'course details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Analysis',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(
              icon: Icon(
                Icons.chat,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, WritingMessageScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Data Analysis Roadmap',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // Shadow color
                      spreadRadius: 3, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Shadow offset (x, y)
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('images/data_analysis.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue[800], // Set the text color
                    ),
                    onPressed: () {},
                    child: Text('View'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue[800], // Set the text color
                    ),
                    onPressed: () {},
                    child: Text('Start'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Suggested courses',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SuggestedCourses(),
              Text(
                'Enrolled courses',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              EnrolledCourses(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // Set the current index for the active item
      ),
    );
  }
}

class SuggestedCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        SuggestedCourseCard(title: 'Python for Beginners'),
        SuggestedCourseCard(title: 'Java Programming'),
        SuggestedCourseCard(title: 'Power BI Dashboard'),
        SuggestedCourseCard(title: 'SQL Development'),
      ],
    );
  }
}

class EnrolledCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        SuggestedCourseCard(title: 'Python for Beginners'),
        SuggestedCourseCard(title: 'Java Programming'),
        SuggestedCourseCard(title: 'Power BI Dashboard'),
        SuggestedCourseCard(title: 'SQL Development'),
      ],
    );
  }
}

class SuggestedCourseCard extends StatelessWidget {
  final String title;

  SuggestedCourseCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 30, // Adjust the size as needed
            backgroundImage: AssetImage(
                'images/cs.jpeg'), // Replace with your course image path
          ),
          SizedBox(height: 15),
          Text(title),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Handle enroll button action
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Color.fromRGBO(21, 101, 192, 1), // Set the text color
            ),
            child: Text('Enroll'),
          ),
        ],
      ),

    );

  }

}