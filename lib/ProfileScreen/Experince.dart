import 'package:flutter/material.dart';
import 'package:techmate/StudentUser/BottonNavigationBar/navbar.dart';
import 'package:techmate/StudentUser/HomeScreens/home.dart';
import 'package:techmate/StudentUser/MentorScreen/mentors.dart';
import 'add.dart';
import 'profile.dart';
import 'package:techmate/Notification/notification.dart';

class ExperienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experience', style: TextStyle(color: Colors.white)),
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
        currentIndex: 4, 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExperienceScreen()),
          );
        },
        child: Icon(Icons.add, color: Colors.white,),
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
