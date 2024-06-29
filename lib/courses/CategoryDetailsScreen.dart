import 'package:flutter/material.dart';
import 'package:techmate/BottonNavigationBar/navbar.dart';
import 'package:techmate/Chats/Track_Chat.dart';
import 'package:techmate/services/courses/CourseCategoryApiService.dart';
import 'package:techmate/services/courses/courseApiService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/shared%20attributes/shared.dart';
import 'package:url_launcher/url_launcher.dart';



class CourseCategoryScreen extends StatefulWidget {
  static const routeName = 'course details';

  @override
  _CourseCategoryScreenState get createState => _CourseCategoryScreenState();
}

class _CourseCategoryScreenState extends State<CourseCategoryScreen> {
  final CourseCategoryApiService _courseApiService = CourseCategoryApiService();
  late Future<List<Course>> _startedCoursesFuture;
  late Future<List<Course>> _suggestedCoursesFuture;
  String? trackType;

  @override
  void initState() {
    super.initState();
    _fetchCourses();
  }

  Future<void> _fetchCourses() async {
    int? nationalId = await getNationalId();
    if (nationalId != null) {
      _startedCoursesFuture = _courseApiService.fetchStartedCourses();
      _suggestedCoursesFuture = _courseApiService.fetchSuggestedCourses(nationalId);
    }
  }

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
                trackType ?? 'Track Type',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              FutureBuilder<List<Course>>(
                future: _startedCoursesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Failed to load started courses'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No started courses available'));
                  } else {
                    List<Course> courses = snapshot.data!;
                    trackType = courses.isNotEmpty ? courses[0].trackType : null;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: courses.map((course) {
                        return CourseCard(
                          title: course.name,
                          level: course.level,
                          link: course.link,
                        );
                      }).toList(),
                    );
                  }
                },
              ),
              SizedBox(height: 16),
              Text(
                'Suggested courses',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              FutureBuilder<List<Course>>(
                future: _suggestedCoursesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Failed to load suggested courses'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No suggested courses available'));
                  } else {
                    List<Course> courses = snapshot.data!;
                    return GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: courses.map((course) {
                        return SuggestedCourseCard(
                          title: course.name,
                          level: course.level,
                          link: course.link,
                        );
                      }).toList(),
                    );
                  }
                },
              ),
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

class SuggestedCourseCard extends StatelessWidget {
  final String title;
  final String level;
  final String link;

  SuggestedCourseCard({
    required this.title,
    required this.level,
    required this.link,
  });

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
          SizedBox(height: 5),
          Text(level),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Open course link
              if (link != null) {
                launch(link);
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Color.fromRGBO(21, 101, 192, 1), // Set the text color
            ),
            child: Text('Start'),
          ),
        ],
      ),

    );

  }

}

class CourseCard extends StatelessWidget {
  final String title;
  final String level;
  final String link;

  CourseCard({
    required this.title,
    required this.level,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // Open course link
          if (link != null) {
            launch(link);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'images/cs.jpeg', // Replace with your course image path
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(level),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
