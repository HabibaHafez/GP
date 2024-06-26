import 'package:flutter/material.dart';
import 'package:techmate/BottonNavigationBar/Navigationbar.dart';

class home_screen extends StatelessWidget {
  static const String routeName = 'home screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 50),
        child: Text('this is home screen'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
      ),
    );
  }
}
