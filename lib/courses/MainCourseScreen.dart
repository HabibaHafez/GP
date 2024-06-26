import 'package:flutter/material.dart';
import 'package:techmate/BottonNavigationBar/Navigationbar.dart';
import 'package:techmate/courses/CategoryDetailsScreen.dart';
import 'package:techmate/courses/CourseDetalisScreen.dart';

class CoursesScreen extends StatelessWidget {
  static const String routeName = 'courses screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Courses',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
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
              Container(
                height: 180,
                child: Stack(
                  children: [
                    // Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'images/cs.jpeg', // Replace with your image path
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Text overlay
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Getting Started With SQL',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Set text color
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
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
              CourseCard(
                title: 'Data Analysis Basics',
                progress: 0.69,
                imagePath: 'images/cs.jpeg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CourseDetailsScreen()),
                  );
                },
              ),
              CourseCard(
                title: 'Python for Beginners',
                progress: 0.45,
                imagePath: 'images/cs.jpeg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CourseDetailsScreen()),
                  );
                },
              ),
              CourseCard(
                title: 'SQL Development',
                progress: 0.30,
                imagePath: 'images/cs.jpeg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CourseDetailsScreen()),
                  );
                },
              ),
              CourseCard(
                title: 'Flutter Development',
                progress: 0.85,
                imagePath: 'images/cs.jpeg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CourseDetailsScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
      ),
    );
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
  final String title;
  final double progress;
  final String imagePath;
  final VoidCallback onTap;

  CourseCard({
    required this.title,
    required this.progress,
    required this.imagePath,
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
                  imagePath,
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: progress,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          const Color.fromRGBO(21, 101, 192, 1)),
                    ), // Set the desired color

                    SizedBox(height: 8),
                    Text('${(progress * 100).toStringAsFixed(0)}% complete'),
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
