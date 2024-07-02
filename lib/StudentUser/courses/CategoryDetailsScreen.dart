// // import 'package:flutter/material.dart';
// // import 'package:techmate/BottonNavigationBar/navbar.dart';
// // import 'package:techmate/Chats/Track_Chat.dart';
// // import 'package:techmate/IntershipsScreen/intershipScreen.dart';
// // import 'package:techmate/ProfileScreen/profile.dart';
// // import 'package:techmate/HomeScreens/home.dart';
// // import 'package:techmate/MentorScreen/mentors.dart';
// // import 'package:techmate/courses/MainCourseScreen.dart';
// // import 'package:techmate/BottonNavigationBar/navbar.dart';
// //
// // class CourseCategoryScreen extends StatelessWidget {
// //   static const routeName = 'course details';
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           'Data Analysis',
// //           style: TextStyle(color: Colors.white),
// //         ),
// //         backgroundColor: Colors.blue[800],
// //         actions: [
// //           Padding(
// //             padding: const EdgeInsets.all(12.0),
// //             child: IconButton(
// //               icon: Icon(
// //                 Icons.chat,
// //                 color: Colors.white,
// //               ),
// //               onPressed: () {
// //                 Navigator.pushNamed(context, WritingMessageScreen.routeName);
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 'Data Analysis Roadmap',
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //               ),
// //               SizedBox(height: 16),
// //               Container(
// //                 height: 180,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(10),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.grey.withOpacity(0.2), // Shadow color
// //                       spreadRadius: 3, // Spread radius
// //                       blurRadius: 7, // Blur radius
// //                       offset: Offset(0, 3), // Shadow offset (x, y)
// //                     ),
// //                   ],
// //                   image: DecorationImage(
// //                     image: AssetImage('images/data_analysis.jpg'),
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 16),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   ElevatedButton(
// //                     style: ElevatedButton.styleFrom(
// //                       foregroundColor: Colors.white, backgroundColor: Colors.blue[800], // Set the text color
// //                     ),
// //                     onPressed: () {},
// //                     child: Text('View'),
// //                   ),
// //                   ElevatedButton(
// //                     style: ElevatedButton.styleFrom(
// //                       foregroundColor: Colors.white, backgroundColor: Colors.blue[800], // Set the text color
// //                     ),
// //                     onPressed: () {},
// //                     child: Text('Start'),
// //                   ),
// //                 ],
// //               ),
// //               SizedBox(height: 16),
// //               Text(
// //                 'Suggested courses',
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //               ),
// //               SizedBox(height: 8),
// //               SuggestedCourses(),
// //               Text(
// //                 'Enrolled courses',
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //               ),
// //               SizedBox(height: 8),
// //               EnrolledCourses(),
// //             ],
// //           ),
// //         ),
// //       ),
// //       bottomNavigationBar: BottomNavBar(
// //         currentIndex: 1, // Set the current index for the active item
// //       ),
// //     );
// //   }
// // }
// //
// // class SuggestedCourses extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return GridView.count(
// //       crossAxisCount: 2,
// //       shrinkWrap: true,
// //       physics: NeverScrollableScrollPhysics(),
// //       children: [
// //         SuggestedCourseCard(title: 'Python for Beginners'),
// //         SuggestedCourseCard(title: 'Java Programming'),
// //         SuggestedCourseCard(title: 'Power BI Dashboard'),
// //         SuggestedCourseCard(title: 'SQL Development'),
// //       ],
// //     );
// //   }
// // }
// //
// // class EnrolledCourses extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return GridView.count(
// //       crossAxisCount: 2,
// //       shrinkWrap: true,
// //       physics: NeverScrollableScrollPhysics(),
// //       children: [
// //         SuggestedCourseCard(title: 'Python for Beginners'),
// //         SuggestedCourseCard(title: 'Java Programming'),
// //         SuggestedCourseCard(title: 'Power BI Dashboard'),
// //         SuggestedCourseCard(title: 'SQL Development'),
// //       ],
// //     );
// //   }
// // }
// //
// // class SuggestedCourseCard extends StatelessWidget {
// //   final String title;
// //
// //   SuggestedCourseCard({required this.title});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       child: Column(
// //         children: [
// //           SizedBox(height: 20),
// //           CircleAvatar(
// //             radius: 30, // Adjust the size as needed
// //             backgroundImage: AssetImage(
// //                 'images/cs.jpeg'), // Replace with your course image path
// //           ),
// //           SizedBox(height: 15),
// //           Text(title),
// //           SizedBox(height: 10),
// //           ElevatedButton(
// //             onPressed: () {
// //               // Handle enroll button action
// //             },
// //             style: ElevatedButton.styleFrom(
// //               foregroundColor: Colors.white, backgroundColor: Color.fromRGBO(21, 101, 192, 1), // Set the text color
// //             ),
// //             child: Text('Enroll'),
// //           ),
// //         ],
// //       ),
// //
// //     );
// //
// //   }
// //
// // }
//
// //
// // import 'package:flutter/material.dart';
// // import 'package:techmate/BottonNavigationBar/navbar.dart';
// // import 'package:techmate/Chats/Track_Chat.dart';
// // import 'package:techmate/IntershipsScreen/intershipScreen.dart';
// // import 'package:techmate/ProfileScreen/profile.dart';
// // import 'package:techmate/HomeScreens/home.dart';
// // import 'package:techmate/MentorScreen/mentors.dart';
// // import 'package:techmate/courses/MainCourseScreen.dart';
// //
// // class CourseCategoryScreen extends StatelessWidget {
// //   static const routeName = 'course details';
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           'Data Analysis',
// //           style: TextStyle(color: Colors.white),
// //         ),
// //         backgroundColor: Colors.blue[800],
// //         actions: [
// //           Padding(
// //             padding: const EdgeInsets.all(12.0),
// //             child: IconButton(
// //               icon: Icon(
// //                 Icons.chat,
// //                 color: Colors.white,
// //               ),
// //               onPressed: () {
// //                 Navigator.pushNamed(context, WritingMessageScreen.routeName);
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 'Data Analysis Roadmap',
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //               ),
// //               SizedBox(height: 16),
// //               Container(
// //                 height: 180,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(10),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.grey.withOpacity(0.2), // Shadow color
// //                       spreadRadius: 3, // Spread radius
// //                       blurRadius: 7, // Blur radius
// //                       offset: Offset(0, 3), // Shadow offset (x, y)
// //                     ),
// //                   ],
// //                   image: DecorationImage(
// //                     image: AssetImage('images/data_analysis.jpg'),
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 16),
// //               Text(
// //                 'Courses',
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //               ),
// //               SizedBox(height: 8),
// //               EnrolledCourses(),
// //             ],
// //           ),
// //         ),
// //       ),
// //       bottomNavigationBar: BottomNavBar(
// //         currentIndex: 0, // Set the current index for the active item
// //       ),
// //     );
// //   }
// // }
// //
// // class EnrolledCourses extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: List.generate(4, (index) {
// //         return Padding(
// //           padding: const EdgeInsets.only(bottom: 8.0), // Small space between cards
// //           child: CourseCard(
// //             title: 'Course Name $index',
// //             provider: 'Provider $index',
// //             level: 'Level $index',
// //           ),
// //         );
// //       }),
// //     );
// //   }
// // }
// //
// // class CourseCard extends StatelessWidget {
// //   final String title;
// //   final String provider;
// //   final String level;
// //
// //   CourseCard({required this.title, required this.provider, required this.level});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: double.infinity,
// //       child: Card(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 title,
// //                 style: TextStyle(
// //                   fontSize: 16,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //                 maxLines: 2,
// //                 overflow: TextOverflow.ellipsis,
// //               ),
// //               SizedBox(height: 4),
// //               Text(
// //                 provider,
// //                 style: TextStyle(
// //                   fontSize: 14,
// //                   color: Colors.grey,
// //                 ),
// //                 maxLines: 1,
// //                 overflow: TextOverflow.ellipsis,
// //               ),
// //               SizedBox(height: 4),
// //               Text(
// //                 level,
// //                 style: TextStyle(
// //                   fontSize: 14,
// //                   color: Colors.blueGrey,
// //                 ),
// //                 maxLines: 1,
// //                 overflow: TextOverflow.ellipsis,
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:techmate/BottonNavigationBar/navbar.dart';
// import 'package:techmate/Chats/Track_Chat.dart';
// import 'package:techmate/services/courses/search_course_service.dart'; // Import the search service
// import 'CourseDetalisScreen.dart';
//
// class CourseCategoryScreen extends StatefulWidget {
//   static const routeName = 'course details';
//   final String categoryName;
//
//   CourseCategoryScreen({required this.categoryName});
//
//   @override
//   _CourseCategoryScreenState createState() => _CourseCategoryScreenState();
// }
//
// class _CourseCategoryScreenState extends State<CourseCategoryScreen> {
//   late Future<List<Course>> futureCourses;
//   String categoryRoadMap = '';
//   bool isRoadMapVisible = false; // Control visibility of the roadmap and category name
//
//   @override
//   void initState() {
//     super.initState();
//     futureCourses = SearchCourseService.searchCoursesByRoadMap(widget.categoryName);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           widget.categoryName,
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.blue[800],
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: IconButton(
//               icon: Icon(
//                 Icons.chat,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 Navigator.pushNamed(context, WritingMessageScreen.routeName);
//               },
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Visibility(
//             visible: isRoadMapVisible, // Conditionally show or hide the roadmap and category name
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '${widget.categoryName} Road Map',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 8),
//                     FutureBuilder<List<Course>>(
//                       future: futureCourses,
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState == ConnectionState.waiting) {
//                           return Center(child: CircularProgressIndicator());
//                         } else if (snapshot.hasError) {
//                           return Center(child: Text('Error: ${snapshot.error}'));
//                         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                           return Center(child: Text('No courses found'));
//                         } else {
//                           categoryRoadMap = snapshot.data![0].roadMap; // Assuming all courses in the category have the same roadmap
//                           return Text(
//                             categoryRoadMap,
//                             style: TextStyle(fontSize: 16, color: Colors.black87),
//                           );
//                         }
//                       },
//                     ),
//                     SizedBox(height: 16), // Space to display the roadmap
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: FutureBuilder<List<Course>>(
//               future: futureCourses,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return Center(child: Text('No courses found'));
//                 } else {
//                   return ListView(
//                     padding: const EdgeInsets.all(16.0),
//                     children: snapshot.data!.map((course) {
//                       return Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: CourseCard(
//                           courseId: course.courseId,
//                           title: course.courseName,
//                           provider: course.provider,
//                           level: course.level,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => CourseDetailsScreen(
//                                   courseId: course.courseId,
//                                   courseTitle: course.courseName,
//                                   provider: course.provider,
//                                   level: course.level,
//                                   duration: course.duration,
//                                   courseDescription: course.roadMap,
//                                   price: course.paid,
//                                   playUrl: course.link,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     }).toList(),
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 0, // Set the current index for the active item
//       ),
//     );
//   }
// }
//
// class CourseCard extends StatelessWidget {
//   final int courseId;
//   final String title;
//   final String provider;
//   final String level;
//   final VoidCallback onTap;
//
//   CourseCard({
//     required this.courseId,
//     required this.title,
//     required this.provider,
//     required this.level,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   provider,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   level,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.blueGrey,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
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
import 'package:flutter/material.dart';
import 'package:techmate/StudentUser/BottonNavigationBar/navbar.dart';
import 'package:techmate/StudentUser/Chats/Track_Chat.dart';
import 'package:techmate/services/courses/search_course_service.dart'; // Import the search service
import 'CourseDetalisScreen.dart';
import 'package:techmate/main.dart';

class CourseCategoryScreen extends StatefulWidget {
  static const routeName = 'course details';
  final String categoryName;

  CourseCategoryScreen({required this.categoryName});

  @override
  _CourseCategoryScreenState createState() => _CourseCategoryScreenState();
}

class _CourseCategoryScreenState extends State<CourseCategoryScreen> {
  late Future<List<Course>> futureCourses;
  String categoryRoadMap = '';
  bool isRoadMapVisible = false; // Control visibility of the roadmap and category name

  @override
  void initState() {
    super.initState();
    futureCourses = SearchCourseService.searchCoursesByRoadMap(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(
              icon: Icon(
                Icons.chat,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  WritingMessageScreen.routeName,
                  arguments: WritingMessageScreenArguments(widget.categoryName),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Visibility(
            visible: isRoadMapVisible, // Conditionally show or hide the roadmap and category name
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.categoryName} Road Map',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    FutureBuilder<List<Course>>(
                      future: futureCourses,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Center(child: Text('No courses found'));
                        } else {
                          categoryRoadMap = snapshot.data![0].roadMap; // Assuming all courses in the category have the same roadmap
                          return Text(
                            categoryRoadMap,
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 16), // Space to display the roadmap
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Course>>(
              future: futureCourses,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No courses found'));
                } else {
                  return ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: snapshot.data!.map((course) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: CourseCard(
                          courseId: course.courseId,
                          title: course.courseName,
                          provider: course.provider,
                          level: course.level,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseDetailsScreen(
                                  courseId: course.courseId,
                                  courseTitle: course.courseName,
                                  provider: course.provider,
                                  level: course.level,
                                  duration: course.duration,
                                  courseDescription: course.roadMap,
                                  price: course.paid,
                                  playUrl: course.link,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0, // Set the current index for the active item
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final int courseId;
  final String title;
  final String provider;
  final String level;
  final VoidCallback onTap;

  CourseCard({
    required this.courseId,
    required this.title,
    required this.provider,
    required this.level,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  provider,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  level,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
