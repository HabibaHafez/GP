import 'package:flutter/material.dart';
import 'package:techmate/BottonNavigationBar/Navigationbar.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = 'profile screen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('this is the profile screen'),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 4,
      ),
    );
  }
}
