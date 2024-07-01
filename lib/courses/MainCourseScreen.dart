// import 'package:flutter/material.dart';
// import 'package:techmate/BottonNavigationBar/navbar.dart';
// import 'package:techmate/courses/CategoryDetailsScreen.dart';
// import 'package:techmate/courses/CourseDetalisScreen.dart';
// import 'package:techmate/HomeScreens/home.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/courses/MainCourseScreen.dart';
// import 'package:techmate/IntershipsScreen/intershipScreen.dart';
//
// class CoursesScreen extends StatelessWidget {
//   static const String routeName = 'courses screen';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Courses',
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
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Search for courses',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.search),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Recommended Courses',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 12),
//               Container(
//                 height: 180,
//                 child: Stack(
//                   children: [
//                     // Image
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.asset(
//                         'images/cs.jpeg', // Replace with your image path
//                         width: double.infinity,
//                         height: 180,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     // Text overlay
//                     Positioned.fill(
//                       child: Align(
//                         alignment: Alignment.center,
//                         child: Text(
//                           'Getting Started With SQL',
//                           style: TextStyle(
//                             fontSize: 23,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white, // Set text color
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30),
//               Text(
//                 'Categories',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               SizedBox(
//                 height: 120, // Adjust this height to fit your content
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     CategoryCard(
//                       icon: Icons.analytics,
//                       title: 'Data Analysis',
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, CourseCategoryScreen.routeName);
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.code,
//                       title: 'Front End',
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, CourseCategoryScreen.routeName);
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.storage,
//                       title: 'Big Data',
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, CourseCategoryScreen.routeName);
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.mobile_friendly,
//                       title: 'Mobile Development',
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, CourseCategoryScreen.routeName);
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.cloud,
//                       title: 'Cloud Computing',
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, CourseCategoryScreen.routeName);
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.security,
//                       title: 'Cyber Security',
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, CourseCategoryScreen.routeName);
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.computer,
//                       title: 'Software Engineering',
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, CourseCategoryScreen.routeName);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30),
//               Text(
//                 'My Learning',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               CourseCard(
//                 title: 'Data Analysis Basics',
//                 progress: 0.69,
//                 imagePath: 'images/cs.jpeg',
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => CourseDetailsScreen()),
//                   );
//                 },
//               ),
//               CourseCard(
//                 title: 'Python for Beginners',
//                 progress: 0.45,
//                 imagePath: 'images/cs.jpeg',
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => CourseDetailsScreen()),
//                   );
//                 },
//               ),
//               CourseCard(
//                 title: 'SQL Development',
//                 progress: 0.30,
//                 imagePath: 'images/cs.jpeg',
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => CourseDetailsScreen()),
//                   );
//                 },
//               ),
//               CourseCard(
//                 title: 'Flutter Development',
//                 progress: 0.85,
//                 imagePath: 'images/cs.jpeg',
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => CourseDetailsScreen()),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 0,
//       ),
//     );
//   }
// }
//
// class CategoryCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final VoidCallback onTap;
//
//   CategoryCard({required this.icon, required this.title, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 150,
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 6),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(icon, size: 30),
//                 SizedBox(height: 8),
//                 Text(
//                   title,
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CourseCard extends StatelessWidget {
//   final String title;
//   final double progress;
//   final String imagePath;
//   final VoidCallback onTap;
//
//   CourseCard({
//     required this.title,
//     required this.progress,
//     required this.imagePath,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: InkWell(
//         onTap: onTap,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Image.asset(
//                   imagePath,
//                   width: 100,
//                   height: 100,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       title,
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 8),
//                     LinearProgressIndicator(
//                       value: progress,
//                       valueColor: AlwaysStoppedAnimation<Color>(
//                           const Color.fromRGBO(21, 101, 192, 1)),
//                     ), // Set the desired color
//
//                     SizedBox(height: 8),
//                     Text('${(progress * 100).toStringAsFixed(0)}% complete'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techmate/BottonNavigationBar/navbar.dart';
// import 'package:techmate/courses/CategoryDetailsScreen.dart';
// import 'package:techmate/courses/CourseDetalisScreen.dart';
// import 'package:techmate/services/courses/recommended_course_service.dart';
// import 'package:techmate/HomeScreens/home.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/courses/MainCourseScreen.dart';
// import 'package:techmate/IntershipsScreen/intershipScreen.dart';
//
// class CoursesScreen extends StatefulWidget {
//   static const String routeName = 'courses screen';
//
//   @override
//   _CoursesScreenState createState() => _CoursesScreenState();
// }
//
// class _CoursesScreenState extends State<CoursesScreen> {
//   late Future<List<RecommendedCourse>> futureRecommendedCourses;
//   String? nationalId;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadNationalId();
//   }
//
//   Future<void> _loadNationalId() async {
//     final id = await getNationalId();
//     if (id != null) {
//       setState(() {
//         nationalId = id.toString();
//         futureRecommendedCourses = RecommendedCourseService.fetchRecommendedCourses(nationalId!);
//       });
//     } else {
//       // Handle the case when national ID is not found
//       setState(() {
//         futureRecommendedCourses = Future.value([]);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Courses',
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
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Search for courses',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.search),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Recommended Courses',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 12),
//               SizedBox(
//                 height: 150, // Adjust the height as needed
//                 child: FutureBuilder<List<RecommendedCourse>>(
//                   future: futureRecommendedCourses,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       return Center(child: Text('Error: ${snapshot.error}'));
//                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                       return Center(child: Text('No recommended courses found'));
//                     } else {
//                       return ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: snapshot.data!.map((course) {
//                           return RecommendedCourseCard(
//                             title: course.courseName,
//                             company: course.provider,
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => CourseDetailsScreen(),
//                                 ),
//                               );
//                             },
//                           );
//                         }).toList(),
//                       );
//                     }
//                   },
//                 ),
//               ),
//               SizedBox(height: 30),
//               Text(
//                 'Categories',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               SizedBox(
//                 height: 120,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     CategoryCard(
//                       icon: Icons.analytics,
//                       title: 'Data Analysis',
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, CourseCategoryScreen.routeName);
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.code,
//                       title: 'Front End',
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, CourseCategoryScreen.routeName);
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.storage,
//                       title: 'Data Science',
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, CourseCategoryScreen.routeName);
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.mobile_friendly,
//                       title: 'Mobile Development',
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, CourseCategoryScreen.routeName);
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.security,
//                       title: 'Cyber Security',
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, CourseCategoryScreen.routeName);
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.computer,
//                       title: 'Software Engineering',
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, CourseCategoryScreen.routeName);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30),
//               Text(
//                 'Started Courses',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               CourseCard(
//                 title: 'Data Analysis Basics',
//                 progress: 0.69,
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => CourseDetailsScreen()),
//                   );
//                 },
//               ),
//               CourseCard(
//                 title: 'Python for Beginners',
//                 progress: 0.45,
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => CourseDetailsScreen()),
//                   );
//                 },
//               ),
//               CourseCard(
//                 title: 'SQL Development',
//                 progress: 0.30,
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => CourseDetailsScreen()),
//                   );
//                 },
//               ),
//               CourseCard(
//                 title: 'Flutter Development',
//                 progress: 0.85,
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => CourseDetailsScreen()),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 0,
//       ),
//     );
//   }
// }
//
// class RecommendedCourseCard extends StatelessWidget {
//   final String title;
//   final String company;
//   final VoidCallback onTap;
//
//   RecommendedCourseCard({
//     required this.title,
//     required this.company,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 250, // Adjust the width as needed
//         margin: EdgeInsets.only(right: 10),
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 16, // Reduced font size
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black, // Set text color
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   company,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey, // Set text color
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CategoryCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final VoidCallback onTap;
//
//   CategoryCard({required this.icon, required this.title, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 150,
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 6),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(icon, size: 30),
//                 SizedBox(height: 8),
//                 Text(
//                   title,
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CourseCard extends StatelessWidget {
//   final String title;
//   final double progress;
//   final VoidCallback onTap;
//
//   CourseCard({
//     required this.title,
//     required this.progress,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: InkWell(
//         onTap: onTap,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       title,
//                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 8),
//                     LinearProgressIndicator(
//                       value: progress,
//                       valueColor: AlwaysStoppedAnimation<Color>(
//                           const Color.fromRGBO(21, 101, 192, 1)),
//                     ), // Set the desired color
//                     SizedBox(height: 8),
//                     Text('${(progress * 100).toStringAsFixed(0)}% complete'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Future<int?> getNationalId() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getInt('national_id');
// }



// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techmate/BottonNavigationBar/navbar.dart';
// import 'package:techmate/courses/CategoryDetailsScreen.dart';
// import 'package:techmate/courses/CourseDetalisScreen.dart';
// import 'package:techmate/services/courses/recommended_course_service.dart';
// import 'package:techmate/services/courses/search_course_service.dart'; // Import the search service
// import 'package:techmate/HomeScreens/home.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/courses/MainCourseScreen.dart';
// import 'package:techmate/IntershipsScreen/intershipScreen.dart';
//
// class CoursesScreen extends StatefulWidget {
//   static const String routeName = 'courses screen';
//
//   @override
//   _CoursesScreenState createState() => _CoursesScreenState();
// }
//
// class _CoursesScreenState extends State<CoursesScreen> {
//   late Future<List<RecommendedCourse>> futureRecommendedCourses;
//   String? nationalId;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadNationalId();
//   }
//
//   Future<void> _loadNationalId() async {
//     final id = await getNationalId();
//     if (id != null) {
//       setState(() {
//         nationalId = id.toString();
//         futureRecommendedCourses = RecommendedCourseService.fetchRecommendedCourses(nationalId!);
//       });
//     } else {
//       // Handle the case when national ID is not found
//       setState(() {
//         futureRecommendedCourses = Future.value([]);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Courses',
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
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Search for courses',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.search),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Recommended Courses',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 12),
//               SizedBox(
//                 height: 150, // Adjust the height as needed
//                 child: FutureBuilder<List<RecommendedCourse>>(
//                   future: futureRecommendedCourses,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       return Center(child: Text('Error: ${snapshot.error}'));
//                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                       return Center(child: Text('No recommended courses found'));
//                     } else {
//                       return ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: snapshot.data!.map((course) {
//                           return RecommendedCourseCard(
//                             title: course.courseName,
//                             company: course.provider,
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => CourseDetailsScreen(),
//                                 ),
//                               );
//                             },
//                           );
//                         }).toList(),
//                       );
//                     }
//                   },
//                 ),
//               ),
//               SizedBox(height: 30),
//               Text(
//                 'Categories',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               SizedBox(
//                 height: 120,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     CategoryCard(
//                       icon: Icons.analytics,
//                       title: 'Data Science',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Data Science'),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.code,
//                       title: 'Frontend Development',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Frontend Development'),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.storage,
//                       title: 'Backend Development',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Backend Development'),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.mobile_friendly,
//                       title: 'Database Managment',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Database Management'),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.security,
//                       title: 'Mobile Development',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Mobile Development'),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.computer,
//                       title: 'Machine Learning',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Machine Learning'),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30),
//               Text(
//                 'Started Courses',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               CourseCard(
//                 title: 'Data Analysis Basics',
//                 progress: 0.69,
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CourseDetailsScreen(),
//                     ),
//                   );
//                 },
//               ),
//               CourseCard(
//                 title: 'Python for Beginners',
//                 progress: 0.45,
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CourseDetailsScreen(),
//                     ),
//                   );
//                 },
//               ),
//               CourseCard(
//                 title: 'SQL Development',
//                 progress: 0.30,
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CourseDetailsScreen(),
//                     ),
//                   );
//                 },
//               ),
//               CourseCard(
//                 title: 'Flutter Development',
//                 progress: 0.85,
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CourseDetailsScreen(),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 0,
//       ),
//     );
//   }
// }
//
// class RecommendedCourseCard extends StatelessWidget {
//   final String title;
//   final String company;
//   final VoidCallback onTap;
//
//   RecommendedCourseCard({
//     required this.title,
//     required this.company,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 250, // Adjust the width as needed
//         margin: EdgeInsets.only(right: 10),
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 16, // Reduced font size
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black, // Set text color
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   company,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey, // Set text color
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CategoryCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final VoidCallback onTap;
//
//   CategoryCard({required this.icon, required this.title, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 150,
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 6),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(icon, size: 30),
//                 SizedBox(height: 6),
//                 Text(
//                   title,
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CourseCard extends StatelessWidget {
//   final String title;
//   final double progress;
//   final VoidCallback onTap;
//
//   CourseCard({
//     required this.title,
//     required this.progress,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: InkWell(
//         onTap: onTap,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       title,
//                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 8),
//                     LinearProgressIndicator(
//                       value: progress,
//                       valueColor: AlwaysStoppedAnimation<Color>(
//                           const Color.fromRGBO(21, 101, 192, 1)),
//                     ), // Set the desired color
//                     SizedBox(height: 8),
//                     Text('${(progress * 100).toStringAsFixed(0)}% complete'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Future<int?> getNationalId() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getInt('national_id');
// }
//


//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techmate/BottonNavigationBar/navbar.dart';
// import 'package:techmate/courses/CategoryDetailsScreen.dart';
// import 'package:techmate/courses/CourseDetalisScreen.dart';
// import 'package:techmate/services/courses/recommended_course_service.dart';
// import 'package:techmate/services/courses/search_course_service.dart';
// import 'package:techmate/services/courses/saved_courses_service.dart'; // Import the new service
// import 'package:techmate/HomeScreens/home.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/courses/MainCourseScreen.dart';
// import 'package:techmate/IntershipsScreen/intershipScreen.dart';
//
// class CoursesScreen extends StatefulWidget {
//   static const String routeName = 'courses screen';
//
//   @override
//   _CoursesScreenState createState() => _CoursesScreenState();
// }
//
// class _CoursesScreenState extends State<CoursesScreen> {
//   late Future<List<RecommendedCourse>> futureRecommendedCourses;
//   late Future<List<SavedCourse>> futureSavedCourses;
//   String? nationalId;
//
//   @override
//   void initState() {
//     super.initState();
//     futureRecommendedCourses = Future.value([]);
//     futureSavedCourses = Future.value([]);
//     _loadNationalId();
//   }
//
//   Future<void> _loadNationalId() async {
//     final id = await getNationalId();
//     if (id != null) {
//       setState(() {
//         nationalId = id.toString();
//         futureRecommendedCourses = RecommendedCourseService.fetchRecommendedCourses(nationalId!);
//         futureSavedCourses = SavedCoursesService.fetchSavedCourses(nationalId!); // Fetch saved courses
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Courses',
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
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Search for courses',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.search),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Recommended Courses',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 12),
//               SizedBox(
//                 height: 150, // Adjust the height as needed
//                 child: FutureBuilder<List<RecommendedCourse>>(
//                   future: futureRecommendedCourses,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       return Center(child: Text('Error: ${snapshot.error}'));
//                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                       return Center(child: Text('No recommended courses found'));
//                     } else {
//                       return ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: snapshot.data!.map((course) {
//                           return RecommendedCourseCard(
//                             title: course.courseName,
//                             company: course.provider,
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => CourseDetailsScreen(),
//                                 ),
//                               );
//                             },
//                           );
//                         }).toList(),
//                       );
//                     }
//                   },
//                 ),
//               ),
//               SizedBox(height: 30),
//               Text(
//                 'Categories',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               SizedBox(
//                 height: 120,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     CategoryCard(
//                       icon: Icons.analytics,
//                       title: 'Data Science',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Data Science'),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.code,
//                       title: 'Frontend Development',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Frontend Development'),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.storage,
//                       title: 'Backend Development',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Backend Development'),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.mobile_friendly,
//                       title: 'Database Management',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Database Management'),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.security,
//                       title: 'Mobile Development',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Mobile Development'),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.computer,
//                       title: 'Machine Learning',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Machine Learning'),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30),
//               Text(
//                 'Saved Courses', // Renamed to Saved Courses
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               FutureBuilder<List<SavedCourse>>(
//                 future: futureSavedCourses,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Center(child: Text('No saved courses found'));
//                   } else {
//                     return Column(
//                       children: snapshot.data!.map((course) {
//                         return CourseCard(
//                           title: course.courseName,
//                           provider: course.provider,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => CourseDetailsScreen(),
//                               ),
//                             );
//                           },
//                         );
//                       }).toList(),
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 0,
//       ),
//     );
//   }
// }
//
// class RecommendedCourseCard extends StatelessWidget {
//   final String title;
//   final String company;
//   final VoidCallback onTap;
//
//   RecommendedCourseCard({
//     required this.title,
//     required this.company,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 250, // Adjust the width as needed
//         margin: EdgeInsets.only(right: 10),
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 16, // Reduced font size
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black, // Set text color
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   company,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey, // Set text color
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CategoryCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final VoidCallback onTap;
//
//   CategoryCard({required this.icon, required this.title, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 152, // Increased width by 2 pixels
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 6),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(icon, size: 30),
//                 SizedBox(height: 6),
//                 Text(
//                   title,
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CourseCard extends StatelessWidget {
//   final String title;
//   final String provider;
//   final VoidCallback onTap;
//
//   CourseCard({
//     required this.title,
//     required this.provider,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0), // Add vertical space between cards
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           width: double.infinity, // Make the card take the whole row
//           child: Card(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     provider,
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Future<int?> getNationalId() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getInt('national_id');
// }

//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techmate/BottonNavigationBar/navbar.dart';
// import 'package:techmate/courses/CategoryDetailsScreen.dart';
// import 'package:techmate/courses/CourseDetalisScreen.dart';
// import 'package:techmate/services/courses/recommended_course_service.dart';
// import 'package:techmate/services/courses/saved_courses_service.dart'; // Import the new service
//
// class CoursesScreen extends StatefulWidget {
//   static const String routeName = 'courses screen';
//
//   @override
//   _CoursesScreenState createState() => _CoursesScreenState();
// }
//
// class _CoursesScreenState extends State<CoursesScreen> {
//   late Future<List<RecommendedCourse>> futureRecommendedCourses;
//   late Future<List<SavedCourse>> futureSavedCourses;
//   String? nationalId;
//
//   @override
//   void initState() {
//     super.initState();
//     futureRecommendedCourses = Future.value([]);
//     futureSavedCourses = Future.value([]);
//     _loadNationalId();
//   }
//
//   Future<void> _loadNationalId() async {
//     final id = await getNationalId();
//     if (id != null) {
//       setState(() {
//         nationalId = id.toString();
//         futureRecommendedCourses = RecommendedCourseService.fetchRecommendedCourses(nationalId!);
//         futureSavedCourses = SavedCoursesService.fetchSavedCourses(nationalId!);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Courses',
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
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Search for courses',
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.search),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Recommended Courses',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 12),
//               SizedBox(
//                 height: 150, // Adjust the height as needed
//                 child: FutureBuilder<List<RecommendedCourse>>(
//                   future: futureRecommendedCourses,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       return Center(child: Text('Error: ${snapshot.error}'));
//                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                       return Center(child: Text('No recommended courses found'));
//                     } else {
//                       return ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: snapshot.data!.map((course) {
//                           return RecommendedCourseCard(
//                             title: course.courseName,
//                             company: course.provider,
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => CourseDetailsScreen(
//                                     courseTitle: course.courseName,
//                                     provider: course.provider,
//                                     level: 'Unknown', // If you don't have this data, set a default value
//                                     duration: 'Unknown', // If you don't have this data, set a default value
//                                     courseDescription: 'No description available', // Default description
//                                     price: 'Free', // Default price
//                                     playUrl: '', // No link available
//                                     courseId: course.courseId, // Ensure courseId is passed
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         }).toList(),
//                       );
//                     }
//                   },
//                 ),
//               ),
//               SizedBox(height: 30),
//               Text(
//                 'Categories',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               SizedBox(
//                 height: 120,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     CategoryCard(
//                       icon: Icons.analytics,
//                       title: 'Data Science',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Data Science'),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.code,
//                       title: 'Frontend Development',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Frontend Development'),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.storage,
//                       title: 'Backend Development',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Backend Development'),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.mobile_friendly,
//                       title: 'Database Management',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Database Management'),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.security,
//                       title: 'Mobile Development',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Mobile Development'),
//                           ),
//                         );
//                       },
//                     ),
//                     CategoryCard(
//                       icon: Icons.computer,
//                       title: 'Machine Learning',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseCategoryScreen(categoryName: 'Machine Learning'),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30),
//               Text(
//                 'Saved Courses', // Renamed to Saved Courses
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               FutureBuilder<List<SavedCourse>>(
//                 future: futureSavedCourses,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Center(child: Text('No saved courses found'));
//                   } else {
//                     return Column(
//                       children: snapshot.data!.map((course) {
//                         return CourseCard(
//                           title: course.courseName,
//                           provider: course.provider,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => CourseDetailsScreen(
//                                   courseTitle: course.courseName,
//                                   provider: course.provider,
//                                   level: course.level,
//                                   duration: course.duration,
//                                   courseDescription: course.roadMap,
//                                   price: course.paid,
//                                   playUrl: course.link,
//                                   courseId: course.courseId,
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       }).toList(),
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 0,
//       ),
//     );
//   }
// }
//
// class RecommendedCourseCard extends StatelessWidget {
//   final String title;
//   final String company;
//   final VoidCallback onTap;
//
//   RecommendedCourseCard({
//     required this.title,
//     required this.company,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 250, // Adjust the width as needed
//         margin: EdgeInsets.only(right: 10),
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 16, // Reduced font size
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black, // Set text color
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   company,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey, // Set text color
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CategoryCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final VoidCallback onTap;
//
//   CategoryCard({required this.icon, required this.title, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 152, // Increased width by 2 pixels
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 6),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(icon, size: 30),
//                 SizedBox(height: 6),
//                 Text(
//                   title,
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CourseCard extends StatelessWidget {
//   final String title;
//   final String provider;
//   final VoidCallback onTap;
//
//   CourseCard({
//     required this.title,
//     required this.provider,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0), // Add vertical space between cards
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           width: double.infinity, // Make the card take the whole row
//           child: Card(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     provider,
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Future<int?> getNationalId() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getInt('national_id');
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/BottonNavigationBar/navbar.dart';
import 'package:techmate/courses/CategoryDetailsScreen.dart';
import 'package:techmate/courses/CourseDetalisScreen.dart';
import 'package:techmate/services/courses/recommended_course_service.dart';
import 'package:techmate/services/courses/search_course_service.dart'; // Import the new service

class CoursesScreen extends StatefulWidget {
  static const String routeName = 'courses screen';

  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  late Future<List<RecommendedCourse>> futureRecommendedCourses;
  late Future<List<Course>> futureSavedCourses;
  String? nationalId;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureRecommendedCourses = Future.value([]);
    futureSavedCourses = SearchCourseService.fetchAllCourses(); // Use fetchAllCourses
    _loadNationalId();
  }

  Future<void> _loadNationalId() async {
    final id = await getNationalId();
    if (id != null) {
      setState(() {
        nationalId = id.toString();
        futureRecommendedCourses = RecommendedCourseService.fetchRecommendedCourses(nationalId!);
        futureSavedCourses = SearchCourseService.fetchAllCourses();
      });
    }
  }

  void _searchCourses() {
    setState(() {
      if (searchController.text.isNotEmpty) {
        futureSavedCourses = SearchCourseService.searchCoursesByName(searchController.text);
      } else {
        futureSavedCourses = SearchCourseService.fetchAllCourses();
      }
    });
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
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search for courses',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onSubmitted: (value) => _searchCourses(),
              ),
              SizedBox(height: 16),
              Text(
                'Recommended Courses',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              SizedBox(
                height: 150, // Adjust the height as needed
                child: FutureBuilder<List<RecommendedCourse>>(
                  future: futureRecommendedCourses,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No recommended courses found'));
                    } else {
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: snapshot.data!.map((course) {
                          return RecommendedCourseCard(
                            title: course.courseName,
                            company: course.provider,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CourseDetailsScreen(
                                    courseTitle: course.courseName,
                                    provider: course.provider,
                                    level: course.level ?? 'Unknown', // Use the actual data or a default value
                                    duration: course.duration ?? 'Unknown', // Use the actual data or a default value
                                    courseDescription: course.roadMap ?? 'No description available', // Use the actual data or a default value
                                    price: course.paid ?? 'Free', // Use the actual data or a default value
                                    playUrl: course.link ?? '', // Use the actual data or a default value
                                    courseId: course.courseId, // Ensure courseId is passed
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryCard(
                      icon: Icons.analytics,
                      title: 'Data Science',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseCategoryScreen(categoryName: 'Data Science'),
                          ),
                        );
                      },
                    ),
                    CategoryCard(
                      icon: Icons.code,
                      title: 'Frontend Development',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseCategoryScreen(categoryName: 'Frontend Development'),
                          ),
                        );
                      },
                    ),
                    CategoryCard(
                      icon: Icons.storage,
                      title: 'Backend Development',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseCategoryScreen(categoryName: 'Backend Development'),
                          ),
                        );
                      },
                    ),
                    CategoryCard(
                      icon: Icons.mobile_friendly,
                      title: 'Database Management',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseCategoryScreen(categoryName: 'Database Management'),
                          ),
                        );
                      },
                    ),
                    CategoryCard(
                      icon: Icons.security,
                      title: 'Mobile Development',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseCategoryScreen(categoryName: 'Mobile Development'),
                          ),
                        );
                      },
                    ),
                    CategoryCard(
                      icon: Icons.computer,
                      title: 'Machine Learning',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseCategoryScreen(categoryName: 'Machine Learning'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Courses', // Renamed to Courses
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              FutureBuilder<List<Course>>(
                future: futureSavedCourses,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No courses found'));
                  } else {
                    return Column(
                      children: snapshot.data!.map((course) {
                        return CourseCard(
                          title: course.courseName,
                          provider: course.provider,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseDetailsScreen(
                                  courseTitle: course.courseName,
                                  provider: course.provider,
                                  level: course.level,
                                  duration: course.duration,
                                  courseDescription: course.roadMap,
                                  price: course.paid,
                                  playUrl: course.link,
                                  courseId: course.courseId,
                                ),
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
}

class RecommendedCourseCard extends StatelessWidget {
  final String title;
  final String company;
  final VoidCallback onTap;

  RecommendedCourseCard({
    required this.title,
    required this.company,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250, // Adjust the width as needed
        margin: EdgeInsets.only(right: 10),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16, // Reduced font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set text color
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  company,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey, // Set text color
                  ),
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
        width: 152, // Increased width by 2 pixels
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 30),
                SizedBox(height: 6),
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
  final String provider;
  final VoidCallback onTap;

  CourseCard({
    required this.title,
    required this.provider,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Add vertical space between cards
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity, // Make the card take the whole row
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    provider,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<int?> getNationalId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('national_id');
}
