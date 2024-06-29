import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/BottonNavigationBar/navbar.dart';
import 'package:techmate/courses/CategoryDetailsScreen.dart';
import 'package:techmate/courses/CourseDetalisScreen.dart';
import 'package:techmate/services/courses/CourseCategoryApiService.dart';
import 'package:techmate/services/courses/courseApiService.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursesScreen extends StatefulWidget {
  static const String routeName = 'courses screen';

  @override
  _CoursesScreenState get createState => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final CourseCategoryApiService _courseApiService = CourseCategoryApiService();
  late Future<List<Course>> _startedCoursesFuture;
  late Future<List<Course>> _suggestedCoursesFuture;

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? nationalId = prefs.getInt('national_id');
    if (nationalId != null) {
      setState(() {
        _startedCoursesFuture = _courseApiService.fetchStartedCourses();
        _suggestedCoursesFuture = _courseApiService.fetchSuggestedCourses(nationalId);
      });
    } else {
      setState(() {
        _startedCoursesFuture = Future.error('National ID not found');
        _suggestedCoursesFuture = Future.error('National ID not found');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Courses',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Search for courses',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Recommended Courses',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
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
                    return Column(
                      children: courses.map((course) {
                        return CourseCard(
                          course: course,
                          onTap: () {
                            if (course.link.isNotEmpty) {
                              _launchURL(course.link);
                            }
                          },
                        );
                      }).toList(),
                    );
                  }
                },
              ),
              SizedBox(height: 30),
              Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 120, // Adjust this height to fit your content
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryCard(
                      icon: Icons.analytics,
                      title: 'Data Analysis',
                      onTap: () {
                        Navigator.pushNamed(
                            context, CourseCategoryScreen.routeName);
                      },
                    ),
                    CategoryCard(
                      icon: Icons.code,
                      title: 'Front End',
                      onTap: () {
                        Navigator.pushNamed(
                            context, CourseCategoryScreen.routeName);
                      },
                    ),
                    CategoryCard(
                      icon: Icons.storage,
                      title: 'Big Data',
                      onTap: () {
                        Navigator.pushNamed(
                            context, CourseCategoryScreen.routeName);
                      },
                    ),
                    CategoryCard(
                      icon: Icons.mobile_friendly,
                      title: 'Mobile Development',
                      onTap: () {
                        Navigator.pushNamed(
                            context, CourseCategoryScreen.routeName);
                      },
                    ),
                    CategoryCard(
                      icon: Icons.cloud,
                      title: 'Cloud Computing',
                      onTap: () {
                        Navigator.pushNamed(
                            context, CourseCategoryScreen.routeName);
                      },
                    ),
                    CategoryCard(
                      icon: Icons.security,
                      title: 'Cyber Security',
                      onTap: () {
                        Navigator.pushNamed(
                            context, CourseCategoryScreen.routeName);
                      },
                    ),
                    CategoryCard(
                      icon: Icons.computer,
                      title: 'Software Engineering',
                      onTap: () {
                        Navigator.pushNamed(
                            context, CourseCategoryScreen.routeName);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                'My Learning',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
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
                    return Column(
                      children: courses.map((course) {
                        return CourseCard(
                          course: course,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseDetailsScreen(course: course),
                              ),
                            );
                          },
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
        currentIndex: 0,
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  CategoryCard({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 30),
                SizedBox(height: 8),
                Text(
                  title,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  CourseCard({
    required this.course,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'images/cs.jpeg', // Use a default image or course-specific image
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
                      course.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(course.level),
                    SizedBox(height: 8),
                    Text(course.provider),
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
