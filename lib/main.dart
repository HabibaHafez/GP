// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:techmate/Chats/Track_Chat.dart';
import 'package:techmate/HomeScreens/home.dart';
import 'package:techmate/IntershipsScreen/intershipScreen.dart';
import 'package:techmate/MentorScreen/mentors.dart';
import 'package:techmate/ProfileScreen/profile.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/Registeration/signup/HR/hr_signup.dart';
import 'package:techmate/Registeration/signup/Mentor/mentor_signup.dart';
import 'package:techmate/Registeration/signup/student/skills_choosen.dart';
import 'package:techmate/Registeration/signup/student/studen_signup.dart';
import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
import 'package:techmate/courses/CourseDetalisScreen.dart';
import 'package:techmate/courses/MainCourseScreen.dart';
import 'package:techmate/courses/CategoryDetailsScreen.dart';
import 'package:techmate/welcom/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      login_screen.routeName: ((BuildContext context) => login_screen()),
      welcome_screen.routeName: ((BuildContext context) => welcome_screen()),
      StudentSignup.routeName: ((BuildContext context) => StudentSignup()),
      mentor_signup.routeName: ((BuildContext context) => mentor_signup()),
      hr_signup.routeName: ((BuildContext context) => hr_signup()),
      HomeScreen.routeName: ((BuildContext context) => HomeScreen()),
      ContinuedSignup.routeName: ((BuildContext context) => ContinuedSignup(firstName: '', email: '', lastName: '', nationalId: '',)),
      ChooseAreaOfInterest.routeName: ((BuildContext context) => ChooseAreaOfInterest(firstName: '', lastName: '', email: '', nationalId: '',)),
      ProfileScreen.routeName: ((BuildContext context) => ProfileScreen()),
      InternshipsScreen.routeName: ((BuildContext context) =>
          InternshipsScreen()),
      MentorsScreen.routeName: ((BuildContext context) => MentorsScreen()),
      CoursesScreen.routeName: ((BuildContext context) => CoursesScreen()),
      CourseCategoryScreen.routeName: ((BuildContext context) =>
          CourseCategoryScreen()),
      WritingMessageScreen.routeName: ((BuildContext context) =>
          WritingMessageScreen()),
      CourseDetailsScreen.routeName: ((BuildContext context) =>
          CourseDetailsScreen()),
    }, initialRoute: welcome_screen.routeName);
  }
}
