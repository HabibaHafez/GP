import 'package:flutter/material.dart';
import 'package:techmate/BottonNavigationBar/Navigationbar.dart';

class MentorShipScreen extends StatelessWidget {
  static const String routeName = 'Mentorship screen';
  const MentorShipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('this is mentorship screen'),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 3,
      ),
    );
  }
}
