// import 'package:flutter/material.dart';
// import 'package:techmate/BottonNavigationBar/navbar.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/HomeScreens/home.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'MainCourseScreen.dart';
// import 'package:techmate/IntershipsScreen/intershipScreen.dart';
//
// class CourseDetailsScreen extends StatelessWidget {
//   static const String routeName = 'courseDetailsScreen';
//   final String courseTitle = 'python';
//
//   // CourseDetailsScreen({required this.courseTitle});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           courseTitle,
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.blue[800],
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.black12,
//                     image: DecorationImage(
//                       image: AssetImage('images/your_image.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Positioned.fill(
//                   child: Align(
//                     alignment: Alignment.center,
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.play_circle_filled,
//                         color: Colors.white,
//                         size: 64,
//                       ),
//                       onPressed: () {
//                         // Handle play button action
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Course Details',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Description:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               'This course provides an in-depth understanding of data analysis using SQL.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Instructor: John Doe',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Number of Sessions: 12',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Price: \$99.99',
//               style: TextStyle(fontSize: 16, color: Colors.red),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Course Content:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Icon(Icons.play_circle_outline),
//                   title: Text('Session ${index + 1}: Introduction to SQL'),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 0,
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:techmate/BottonNavigationBar/navbar.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/HomeScreens/home.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'MainCourseScreen.dart';
// import 'package:techmate/IntershipsScreen/intershipScreen.dart';
// import 'package:url_launcher/url_launcher.dart'; // Add this import for launching URLs
//
// class CourseDetailsScreen extends StatefulWidget {
//   static const String routeName = 'courseDetailsScreen';
//   final String courseTitle = 'Python for Beginners';
//   final String provider = 'Provider A';
//   final String level = 'Beginner';
//   final String duration = '10 hours';
//   final String courseDescription = 'This course provides an in-depth understanding of data analysis using SQL.';
//   final String price = '\$99.99';
//   final String playUrl = 'https://example.com'; // The URL to redirect to when the play button is pressed
//
//   @override
//   _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
// }
//
// class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
//   bool isSaved = false;
//
//   void toggleSave() {
//     setState(() {
//       isSaved = !isSaved;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           widget.courseTitle,
//           style: TextStyle(color: Colors.white, fontSize: 18), // Decreased font size
//         ),
//         backgroundColor: Colors.blue[800],
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.black12,
//                     image: DecorationImage(
//                       image: AssetImage('images/your_image.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Positioned.fill(
//                   child: Align(
//                     alignment: Alignment.center,
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.play_circle_filled,
//                         color: Colors.white,
//                         size: 64,
//                       ),
//                       onPressed: () async {
//                         if (await canLaunch(widget.playUrl)) {
//                           await launch(widget.playUrl);
//                         } else {
//                           throw 'Could not launch ${widget.playUrl}';
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Course Details',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     isSaved ? Icons.star : Icons.star_border,
//                     color: isSaved ? Colors.yellow : Colors.grey,
//                   ),
//                   onPressed: toggleSave,
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Provider: ${widget.provider}',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Level: ${widget.level}',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Duration: ${widget.duration}',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Description:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               widget.courseDescription,
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Price: ${widget.price}',
//               style: TextStyle(fontSize: 16, color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 0,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/services/courses/save_unsave_course_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../BottonNavigationBar/navbar.dart';

class CourseDetailsScreen extends StatefulWidget {
  static const String routeName = 'courseDetailsScreen';
  final String courseTitle;
  final String provider;
  final String level;
  final String duration;
  final String courseDescription;
  final String price;
  final String playUrl;
  final int courseId;

  CourseDetailsScreen({
    required this.courseTitle,
    required this.provider,
    required this.level,
    required this.duration,
    required this.courseDescription,
    required this.price,
    required this.playUrl,
    required this.courseId,
  });

  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    _checkIfCourseIsSaved();
  }

  void _checkIfCourseIsSaved() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? nationalId = prefs.getString('national_id');
    if (nationalId != null) {
      bool saved = await SaveUnsaveCourseService.isCourseSaved(nationalId, widget.courseId);
      setState(() {
        isSaved = saved;
      });
    }
  }

  void toggleSave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? nationalId = prefs.getString('national_id');
    if (nationalId != null) {
      if (isSaved) {
        await SaveUnsaveCourseService.unsaveCourse(nationalId, widget.courseId);
      } else {
        await SaveUnsaveCourseService.saveCourse(nationalId, widget.courseId);
      }
      setState(() {
        isSaved = !isSaved;
      });
    }
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.courseTitle,
          style: TextStyle(color: Colors.white, fontSize: 18),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: IconButton(
                icon: Icon(
                  Icons.play_circle_filled,
                  color: Colors.blue[800],
                  size: 64,
                ),
                onPressed: () => _launchURL(widget.playUrl),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Course Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(
                    isSaved ? Icons.star : Icons.star_border,
                    color: isSaved ? Colors.yellow : Colors.grey,
                  ),
                  onPressed: toggleSave,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Provider: ${widget.provider}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Level: ${widget.level}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Duration: ${widget.duration}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.courseDescription,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Price: ${widget.price}',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}
