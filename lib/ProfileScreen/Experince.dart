import 'package:flutter/material.dart';
import 'package:techmate/BottonNavigationBar/navbar.dart';
import 'package:techmate/HomeScreens/home.dart';
import 'package:techmate/MentorScreen/mentors.dart';
import 'add.dart';
import 'profile.dart';

class ExperienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experience', style: TextStyle(color: Colors.blue[800])),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text('Experience', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800])),
          ),
          ExperienceTile(
            title: 'Coding Instructor',
            company: 'iSchool',
            type: 'Part-time',
            date: 'Sep 2023 - Mar 2024 · 7 mos',
            location: 'Cairo, Egypt · Remote',
          ),
          ExperienceTile(
            title: 'Backend intern ',
            company: 'Vois',
            type: 'Internship',
            date: 'Jul 2023 - Sep 2023 · 3 mos',
            location: 'Egypt · On-site',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: Text('Education', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[800])),
          ),
          ExperienceTile(
            title: 'Cairo University',
            degree: 'Bachelor degree of computer science',
            field: 'Information Systems Department ',
            date: '2020 - 2024',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4, // Set the current index for the active item
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExperienceScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[800],
      ),
    );
  }
}

class ExperienceTile extends StatelessWidget {
  final String title;
  final String? company;
  final String? type;
  final String date;
  final String? location;
  final String? degree;
  final String? field;

  ExperienceTile({
    required this.title,
    this.company,
    this.type,
    required this.date,
    this.location,
    this.degree,
    this.field,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            if (company != null) Text(company!, style: TextStyle(color: Colors.grey[700])),
            if (type != null) Text(type!),
            Text(date),
            if (location != null) Text(location!),
            if (degree != null) Text(degree!, style: TextStyle(color: Colors.grey[700])),
            if (field != null) Text(field!),
          ],
        ),
      ),
    );
  }
}
