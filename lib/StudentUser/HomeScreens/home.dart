// import 'package:flutter/material.dart';
// import 'package:techmate/BottonNavigationBar/navbar.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'package:techmate/ProfileScreen/Saved.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/Notification/notification.dart';
// import 'search.dart';
// import 'package:techmate/services/Home/intern_recommendations_service.dart';
// import 'package:techmate/IntershipsScreen/internship_details.dart';
//
// class HomeScreen extends StatefulWidget {
//   static const routeName = 'home screen';
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final InternRecommendationsService _internService = InternRecommendationsService();
//   List<Map<String, dynamic>> _recommendedInternships = [];
//   bool _isLoading = true;
//   bool _showSavedSection = false; // Control visibility of the "Saved" section
//
//   // Sample data for saved items
//   final List<Map<String, String>> _savedItems = [
//     {'type': 'internship', 'title': 'Web Development Intern', 'image': 'https://example.com/internship1.jpg'},
//     {'type': 'course', 'title': 'Flutter Development', 'image': 'https://example.com/course1.jpg'},
//     {'type': 'internship', 'title': 'Data Science Intern', 'image': 'https://example.com/internship2.jpg'},
//     {'type': 'course', 'title': 'React Native', 'image': 'https://example.com/course2.jpg'},
//     {'type': 'course', 'title': 'Machine Learning', 'image': 'https://example.com/course3.jpg'},
//   ];
//
//   String _selectedFilter = 'all';
//
//   List<Map<String, String>> _getFilteredSavedItems() {
//     if (_selectedFilter == 'all') {
//       return _savedItems.take(2).toList(); // Show the latest 2-3 items
//     } else {
//       return _savedItems.where((item) => item['type'] == _selectedFilter).take(3).toList();
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchRecommendations();
//   }
//
//   Future<void> _fetchRecommendations() async {
//     try {
//       List<Map<String, dynamic>> recommendations = await _internService.fetchRecommendations('1234566322');
//       setState(() {
//         _recommendedInternships = recommendations;
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to load recommendations: $e')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome, Habiba Hafez', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blue[800],
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications, color: Colors.white),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search for courses and internships',
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//                 ),
//                 readOnly: true, // Makes the TextField read-only
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Recommended internships for you',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//             ),
//             Container(
//               height: 220,
//               child: _isLoading
//                   ? Center(child: CircularProgressIndicator())
//                   : PageView.builder(
//                 itemCount: _recommendedInternships.length,
//                 itemBuilder: (context, index) {
//                   final internship = _recommendedInternships[index];
//                   return Container(
//                     margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Flexible(
//                             child: Image.network(
//                               internship['Link'] ?? 'https://example.com/default_image.jpg', // Ensure the image URL is correct
//                               height: 80,
//                               errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Flexible(
//                             child: Text(
//                               internship['InternTitle'] ?? 'No title',
//                               style: TextStyle(color: Colors.black),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Flexible(
//                             child: Text(
//                               internship['CompanyName'] ?? 'No company',
//                               style: TextStyle(color: Colors.grey),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => InternshipDetails(internship: internship),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               'Apply',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue[800],
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Recommended Courses',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//             ),
//             Container(
//               height: 220,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 10, // Adjust this based on the number of recommended courses
//                 itemBuilder: (context, index) {
//                   return Container(
//                     width: 160,
//                     margin: EdgeInsets.all(8.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Flexible(
//                             child: Image.network(
//                               'https://example.com/course$index.jpg',
//                               height: 80,
//                               errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Flexible(
//                             child: Text(
//                               'Google Data Analytics',
//                               style: TextStyle(color: Colors.black),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           Flexible(
//                             child: Text(
//                               'Google',
//                               style: TextStyle(color: Colors.grey),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             if (_showSavedSection) ...[
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Text(
//                   'Saved',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     DropdownButton<String>(
//                       value: _selectedFilter,
//                       items: [
//                         DropdownMenuItem(value: 'all', child: Text('All')),
//                         DropdownMenuItem(value: 'internship', child: Text('Internships')),
//                         DropdownMenuItem(value: 'course', child: Text('Courses')),
//                       ],
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedFilter = value!;
//                         });
//                       },
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => SavedScreen()));
//                       },
//                       child: Text('Show More'),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 child: Column(
//                   children: _getFilteredSavedItems().map((item) {
//                     return ListTile(
//                       leading: Image.network(
//                         item['image']!,
//                         width: 50,
//                         height: 50,
//                         fit: BoxFit.cover,
//                         errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
//                       ),
//                       title: Text(item['title']!),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 2,
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:techmate/BottonNavigationBar/navbar.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/Notification/notification.dart';
// import 'search.dart';
// import 'package:techmate/services/Home/intern_recommendations_service.dart';
// import 'package:techmate/IntershipsScreen/internship_details.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class HomeScreen extends StatefulWidget {
//   static const routeName = 'home screen';
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final InternRecommendationsService _internService = InternRecommendationsService();
//   List<Map<String, dynamic>> _recommendedInternships = [];
//   bool _isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchRecommendations();
//   }
//
//   // Future<void> _loadNationalId() async {
//   //   final id = await getNationalId();
//   //   if (id != null) {
//   //     setState(() {
//   //       nationalId = id.toString();
//   //       futureRecommendedCourses = RecommendedCourseService.fetchRecommendedCourses(nationalId!);
//   //       futureSavedCourses = SearchCourseService.fetchAllCourses();
//   //     });
//   //   }
//   // }
//
//
//   Future<void> _fetchRecommendations() async {
//     try {
//       List<Map<String, dynamic>> recommendations = await _internService.fetchRecommendations('nationalID');
//       setState(() {
//         _recommendedInternships = recommendations;
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to load recommendations: $e')),
//       );
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blue[800],
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications, color: Colors.white),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search for courses and internships',
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//                 ),
//                 readOnly: true, // Makes the TextField read-only
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Recommended internships for you',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//             ),
//             Container(
//               height: 220,
//               child: _isLoading
//                   ? Center(child: CircularProgressIndicator())
//                   : PageView.builder(
//                 itemCount: _recommendedInternships.length,
//                 itemBuilder: (context, index) {
//                   final internship = _recommendedInternships[index];
//                   return Container(
//                     margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 8),
//                           Flexible(
//                             child: Text(
//                               internship['InternTitle'] ?? 'No title',
//                               style: TextStyle(color: Colors.black),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Flexible(
//                             child: Text(
//                               internship['CompanyName'] ?? 'No company',
//                               style: TextStyle(color: Colors.grey),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => InternshipDetails(internship: internship),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               'Apply',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue[800],
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Recommended Courses',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//             ),
//             Container(
//               height: 220,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 10, // Adjust this based on the number of recommended courses
//                 itemBuilder: (context, index) {
//                   return Container(
//                     width: 160,
//                     margin: EdgeInsets.all(8.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 8),
//                           Flexible(
//                             child: Text(
//                               'Google Data Analytics',
//                               style: TextStyle(color: Colors.black),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           Flexible(
//                             child: Text(
//                               'Google',
//                               style: TextStyle(color: Colors.grey),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 2,
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
// import 'package:techmate/BottonNavigationBar/navbar.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/Notification/notification.dart';
// import 'search.dart';
// import 'package:techmate/services/Home/intern_recommendations_service.dart';
// import 'package:techmate/IntershipsScreen/internship_details.dart';
// import 'package:techmate/services/courses/recommended_course_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class HomeScreen extends StatefulWidget {
//   static const routeName = 'home screen';
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final InternRecommendationsService _internService = InternRecommendationsService();
//   List<Map<String, dynamic>> _recommendedInternships = [];
//   List<RecommendedCourse> _recommendedCourses = [];
//   bool _isLoadingInternships = true;
//   bool _isLoadingCourses = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchRecommendations();
//     _fetchRecommendedCourses();
//   }
//
//   Future<int?> getNationalId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getInt('national_id');
//   }
//
//   Future<void> _fetchRecommendations() async {
//     setState(() {
//       _isLoadingInternships = true;
//     });
//
//     try {
//       final nationalId = await getNationalId();
//       if (nationalId != null) {
//         List<Map<String, dynamic>> recommendations = await _internService.fetchRecommendations(nationalId.toString());
//         setState(() {
//           _recommendedInternships = recommendations;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('No national ID found')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to load recommendations: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoadingInternships = false;
//       });
//     }
//   }
//
//   Future<void> _fetchRecommendedCourses() async {
//     setState(() {
//       _isLoadingCourses = true;
//     });
//
//     try {
//       final nationalId = await getNationalId();
//       if (nationalId != null) {
//         List<RecommendedCourse> courses = await RecommendedCourseService.fetchRecommendedCourses(nationalId.toString());
//         setState(() {
//           _recommendedCourses = courses;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('No national ID found')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to load recommended courses: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoadingCourses = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blue[800],
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications, color: Colors.white),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search for courses and internships',
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//                 ),
//                 readOnly: true,
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Recommended internships for you',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//             ),
//             Container(
//               height: 220,
//               child: _isLoadingInternships
//                   ? Center(child: CircularProgressIndicator())
//                   : PageView.builder(
//                 itemCount: _recommendedInternships.length,
//                 itemBuilder: (context, index) {
//                   final internship = _recommendedInternships[index];
//                   return Container(
//                     margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 8),
//                           Flexible(
//                             child: Text(
//                               internship['InternTitle'] ?? 'No title',
//                               style: TextStyle(color: Colors.black),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Flexible(
//                             child: Text(
//                               internship['CompanyName'] ?? 'No company',
//                               style: TextStyle(color: Colors.grey),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => InternshipDetails(internship: internship),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               'Apply',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue[800],
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Recommended Courses',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//             ),
//             Container(
//               height: 220,
//               child: _isLoadingCourses
//                   ? Center(child: CircularProgressIndicator())
//                   : PageView.builder(
//                 itemCount: _recommendedCourses.length,
//                 itemBuilder: (context, index) {
//                   final course = _recommendedCourses[index];
//                   return Container(
//                     margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: 8),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                             child: Text(
//                               course.courseName,
//                               style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                             child: Text(
//                               course.provider,
//                               style: TextStyle(color: Colors.grey, fontSize: 14),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 2,
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:techmate/BottonNavigationBar/navbar.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/Notification/notification.dart';
// import 'search.dart';
// import 'package:techmate/services/Home/intern_recommendations_service.dart';
// import 'package:techmate/IntershipsScreen/internship_details.dart';
// import 'package:techmate/services/courses/recommended_course_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techmate/courses/CourseDetalisScreen.dart'; // Import the CourseDetailsScreen
//
// class HomeScreen extends StatefulWidget {
//   static const routeName = 'home screen';
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final InternRecommendationsService _internService = InternRecommendationsService();
//   List<Map<String, dynamic>> _recommendedInternships = [];
//   List<RecommendedCourse> _recommendedCourses = [];
//   bool _isLoadingInternships = true;
//   bool _isLoadingCourses = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchRecommendations();
//     _fetchRecommendedCourses();
//   }
//
//   Future<int?> getNationalId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getInt('national_id');
//   }
//
//   Future<void> _fetchRecommendations() async {
//     setState(() {
//       _isLoadingInternships = true;
//     });
//
//     try {
//       final nationalId = await getNationalId();
//       if (nationalId != null) {
//         List<Map<String, dynamic>> recommendations = await _internService.fetchRecommendations(nationalId.toString());
//         setState(() {
//           _recommendedInternships = recommendations;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('No national ID found')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to load recommendations: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoadingInternships = false;
//       });
//     }
//   }
//
//   Future<void> _fetchRecommendedCourses() async {
//     setState(() {
//       _isLoadingCourses = true;
//     });
//
//     try {
//       final nationalId = await getNationalId();
//       if (nationalId != null) {
//         List<RecommendedCourse> courses = await RecommendedCourseService.fetchRecommendedCourses(nationalId.toString());
//         setState(() {
//           _recommendedCourses = courses;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('No national ID found')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to load recommended courses: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoadingCourses = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blue[800],
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications, color: Colors.white),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search for courses and internships',
//                   prefixIcon: Icon(Icons.search, color: Colors.grey),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//                 ),
//                 readOnly: true,
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Recommended internships for you',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//             ),
//             Container(
//               height: 220,
//               child: _isLoadingInternships
//                   ? Center(child: CircularProgressIndicator())
//                   : PageView.builder(
//                 itemCount: _recommendedInternships.length,
//                 itemBuilder: (context, index) {
//                   final internship = _recommendedInternships[index];
//                   return Container(
//                     margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 8),
//                           Flexible(
//                             child: Text(
//                               internship['InternTitle'] ?? 'No title',
//                               style: TextStyle(color: Colors.black),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Flexible(
//                             child: Text(
//                               internship['CompanyName'] ?? 'No company',
//                               style: TextStyle(color: Colors.grey),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => InternshipDetails(internship: internship),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               'Apply',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue[800],
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Recommended Courses',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//             ),
//             Container(
//               height: 220,
//               child: _isLoadingCourses
//                   ? Center(child: CircularProgressIndicator())
//                   : ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 itemCount: _recommendedCourses.length,
//                 itemBuilder: (context, index) {
//                   final course = _recommendedCourses[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CourseDetailsScreen(
//                             courseTitle: course.courseName,
//                             provider: course.provider,
//                             level: course.level,
//                             duration: course.duration,
//                             courseDescription: course.roadMap,
//                             price: course.paid,
//                             playUrl: course.link,
//                             courseId: course.courseId,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       height: 100,
//                       margin: EdgeInsets.all(8.0),
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: 8),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: Text(
//                                 course.courseName,
//                                 style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: Text(
//                                 course.provider,
//                                 style: TextStyle(color: Colors.grey, fontSize: 14),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 2,
//       ),
//     );
//   }
// }
//
//
// import 'package:flutter/material.dart';
// import 'package:techmate/BottonNavigationBar/navbar.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/Notification/notification.dart';
// import 'package:techmate/services/Home/intern_recommendations_service.dart';
// import 'package:techmate/IntershipsScreen/internship_details.dart';
// import 'package:techmate/services/courses/recommended_course_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techmate/courses/CourseDetalisScreen.dart'; // Import the CourseDetailsScreen
//
// class HomeScreen extends StatefulWidget {
//   static const routeName = 'home screen';
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final InternRecommendationsService _internService = InternRecommendationsService();
//   List<Map<String, dynamic>> _recommendedInternships = [];
//   List<RecommendedCourse> _recommendedCourses = [];
//   bool _isLoadingInternships = true;
//   bool _isLoadingCourses = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchRecommendations();
//     _fetchRecommendedCourses();
//   }
//
//   Future<int?> getNationalId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getInt('national_id');
//   }
//
//   Future<void> _fetchRecommendations() async {
//     setState(() {
//       _isLoadingInternships = true;
//     });
//
//     try {
//       final nationalId = await getNationalId();
//       if (nationalId != null) {
//         List<Map<String, dynamic>> recommendations = await _internService.fetchRecommendations(nationalId.toString());
//         setState(() {
//           _recommendedInternships = recommendations;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('No national ID found')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to load recommendations: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoadingInternships = false;
//       });
//     }
//   }
//
//   Future<void> _fetchRecommendedCourses() async {
//     setState(() {
//       _isLoadingCourses = true;
//     });
//
//     try {
//       final nationalId = await getNationalId();
//       if (nationalId != null) {
//         List<RecommendedCourse> courses = await RecommendedCourseService.fetchRecommendedCourses(nationalId.toString());
//         setState(() {
//           _recommendedCourses = courses;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('No national ID found')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to load recommended courses: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoadingCourses = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blue[800],
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications, color: Colors.white),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Recommended internships for you',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//             ),
//             Container(
//               height: 220,
//               child: _isLoadingInternships
//                   ? Center(child: CircularProgressIndicator())
//                   : PageView.builder(
//                 itemCount: _recommendedInternships.length,
//                 itemBuilder: (context, index) {
//                   final internship = _recommendedInternships[index];
//                   return Container(
//                     margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 8),
//                           Flexible(
//                             child: Text(
//                               internship['InternTitle'] ?? 'No title',
//                               style: TextStyle(color: Colors.black),
//                               overflow: TextOverflow.ellipsis,
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Flexible(
//                             child: Text(
//                               internship['CompanyName'] ?? 'No company',
//                               style: TextStyle(color: Colors.grey),
//                               overflow: TextOverflow.ellipsis,
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => InternshipDetails(internship: internship),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               'Apply',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue[800],
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Recommended Courses',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//             ),
//             Container(
//               height: 320,
//               child: _isLoadingCourses
//                   ? Center(child: CircularProgressIndicator())
//                   : ListView.builder(
//                 itemCount: _recommendedCourses.length,
//                 scrollDirection: Axis.vertical,
//                 itemBuilder: (context, index) {
//                   final course = _recommendedCourses[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CourseDetailsScreen(
//                             courseTitle: course.courseName,
//                             provider: course.provider,
//                             level: course.level,
//                             duration: course.duration,
//                             courseDescription: course.roadMap,
//                             price: course.paid,
//                             playUrl: course.link,
//                             courseId: course.courseId,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       height: 140,
//                       margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(height: 8),
//                             Flexible(
//                               child: Text(
//                                 course.courseName,
//                                 style: TextStyle(color: Colors.black),
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Flexible(
//                               child: Text(
//                                 course.provider,
//                                 style: TextStyle(color: Colors.grey),
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 2,
//       ),
//     );
//   }
// }
//


import 'package:flutter/material.dart';
import 'package:techmate/StudentUser/BottonNavigationBar/navbar.dart';
import 'package:techmate/StudentUser/MentorScreen/mentors.dart';
import 'package:techmate/ProfileScreen/profile.dart';
import 'package:techmate/Notification/notification.dart';
import 'package:techmate/services/Home/intern_recommendations_service.dart';
import 'package:techmate/StudentUser/IntershipsScreen/internship_details.dart';
import 'package:techmate/services/courses/recommended_course_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/StudentUser/courses/CourseDetalisScreen.dart'; // Import the CourseDetailsScreen

class HomeScreen extends StatefulWidget {
  static const routeName = 'home screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final InternRecommendationsService _internService = InternRecommendationsService();
  List<Map<String, dynamic>> _recommendedInternships = [];
  List<RecommendedCourse> _recommendedCourses = [];
  bool _isLoadingInternships = true;
  bool _isLoadingCourses = true;

  @override
  void initState() {
    super.initState();
    _fetchRecommendations();
    _fetchRecommendedCourses();
  }

  Future<int?> getNationalId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('national_id');
  }

  Future<void> _fetchRecommendations() async {
    setState(() {
      _isLoadingInternships = true;
    });

    try {
      final nationalId = await getNationalId();
      if (nationalId != null) {
        List<Map<String, dynamic>> recommendations = await _internService.fetchRecommendations(nationalId.toString());
        setState(() {
          _recommendedInternships = recommendations;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No national ID found')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load recommendations: $e')),
      );
    } finally {
      setState(() {
        _isLoadingInternships = false;
      });
    }
  }

  Future<void> _fetchRecommendedCourses() async {
    setState(() {
      _isLoadingCourses = true;
    });

    try {
      final nationalId = await getNationalId();
      if (nationalId != null) {
        List<RecommendedCourse> courses = await RecommendedCourseService.fetchRecommendedCourses(nationalId.toString());
        setState(() {
          _recommendedCourses = courses;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No national ID found')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load recommended courses: $e')),
      );
    } finally {
      setState(() {
        _isLoadingCourses = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Recommended internships for you',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Container(
              height: 220,
              child: _isLoadingInternships
                  ? Center(child: CircularProgressIndicator())
                  : PageView.builder(
                itemCount: _recommendedInternships.length,
                itemBuilder: (context, index) {
                  final internship = _recommendedInternships[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InternshipDetails(internship: internship),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 8),
                            Flexible(
                              child: Text(
                                internship['InternTitle'] ?? 'No title',
                                style: TextStyle(color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 4),
                            Flexible(
                              child: Text(
                                internship['CompanyName'] ?? 'No company',
                                style: TextStyle(color: Colors.grey),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Recommended Courses',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Container(
              height: 320,
              child: _isLoadingCourses
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: _recommendedCourses.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final course = _recommendedCourses[index];
                  return GestureDetector(
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
                    child: Container(
                      height: 140,
                      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 8),
                            Flexible(
                              child: Text(
                                course.courseName,
                                style: TextStyle(color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 4),
                            Flexible(
                              child: Text(
                                course.provider,
                                style: TextStyle(color: Colors.grey),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
      ),
    );
  }
}
