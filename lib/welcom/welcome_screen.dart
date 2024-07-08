import 'package:flutter/material.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/Registeration/signup/Registeration/Registeration.dart';
import 'package:techmate/commponent/button.dart';

class welcome_screen extends StatelessWidget {
  static const routeName = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(initialPage: 0);

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          buildWelcomePage(),
          buildFeaturePage(
            context,
            title: 'Tech Mate for Students',
            features: [
              'Personalized Learning Paths',
              'Connect with Mentors',
              'Exclusive Internships',
              'Career Resources'
            ],
            icon: Icons.school,
          ),
          buildFeaturePage(
            context,
            title: 'Tech Mate For Mentors',
            features: [
              'Share Your Expertise',
              'Schedule Meetings Easily',
              'Community Engagement',
              'Profile Building'
            ],
            icon: Icons.person,
          ),
          buildFeaturePage(
            context,
            title: 'Tech Mate For Recruiters',
            features: [
              'Post Internship Opportunities',
              'Discover Top Talent',
              'Build Your Company Profile'
            ],
            icon: Icons.business,
            showButton: true,
          ),
        ],
      ),
    );
  }

  Widget buildWelcomePage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/44.png', height: 150),
            SizedBox(height: 16),
            Text(
              'Welcome to\nTechMate',
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFeaturePage(BuildContext context,
      {required String title,
        required List<String> features,
        IconData? icon,
        bool showButton = false}) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 50,
                color: Colors.blue[800],
              ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ...features.map((feature) => buildFeatureCard(feature)).toList(),
            if (showButton)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registeration()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Get started",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildFeatureCard(String feature) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: buildCustomCheckbox(),
        title: Text(
          feature,
          style: TextStyle(fontSize: 16, color: Colors.blue[800]),
        ),
      ),
    );
  }

  Widget buildCustomCheckbox() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(4.0),
      ),
      width: 24,
      height: 24,
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
