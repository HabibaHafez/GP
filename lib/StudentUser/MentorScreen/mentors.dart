// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techmate/StudentUser/BottonNavigationBar/navbar.dart';
// import 'package:techmate/StudentUser/Chats/Mentorchat.dart';
// import 'package:techmate/StudentUser/MentorScreen/bookings.dart';
// import 'package:techmate/providers/BookingProvider.dart';
// import 'package:techmate/services/Mentor/getmentor.dart';
//
// import 'mentorprofile.dart';
//
// class MentorsScreen extends StatefulWidget {
//   static const String routeName = 'mentor screen';
//
//   const MentorsScreen({super.key});
//
//   @override
//   _MentorsScreenState createState() => _MentorsScreenState();
// }
//
// class _MentorsScreenState extends State<MentorsScreen> {
//   late Future<List<Mentor>> _futureMentors;
//   int? currentUserId;
//   final TextEditingController _searchController = TextEditingController();
//   String _searchText = "";
//
//   @override
//   void initState() {
//     super.initState();
//     _futureMentors = MentorService().getMentors();
//     _getCurrentUserId();
//   }
//
//   Future<void> _getCurrentUserId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int? userId = prefs.getInt('national_id');
//     setState(() {
//       currentUserId = userId;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final bookingProvider = Provider.of<BookingProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title:
//         const Text('Find a Mentor', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blue[800],
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.event_note, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       BookingsScreen(studentId: currentUserId ?? 0),
//                 ),
//               );
//             },
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(60.0),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 setState(() {
//                   _searchText = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search by area of interest...',
//                 hintStyle: const TextStyle(color: Colors.white54),
//                 prefixIcon: const Icon(Icons.search, color: Colors.white),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.clear, color: Colors.white),
//                   onPressed: () {
//                     setState(() {
//                       _searchController.clear();
//                       _searchText = '';
//                       _futureMentors =
//                           MentorService().getMentors(); // Reset to all mentors
//                     });
//                   },
//                 ),
//                 border: InputBorder.none,
//               ),
//               style: const TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder<List<Mentor>>(
//               future: _searchText.isEmpty
//                   ? _futureMentors
//                   : MentorService().searchMentorsByAreaOfInterest(_searchText),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return const Center(child: Text('No mentors found'));
//                 } else {
//                   List<Mentor> filteredMentors = snapshot.data!;
//
//                   return ListView.builder(
//                     itemCount: filteredMentors.length,
//                     itemBuilder: (context, index) {
//                       final mentor = filteredMentors[index];
//                       return ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: mentor.imageUrl != null
//                               ? NetworkImage(mentor.imageUrl!)
//                               : null,
//                         ),
//                         title: Text('${mentor.firstname} ${mentor.lastname}'),
//                         subtitle: Text(mentor.jobtitle),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.visibility),
//                               onPressed: () {
//                                 bookingProvider.setMentorId(mentor.id);
//
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => MentorProfileScreen(
//                                       mentor: mentor,
//                                       currentUserId: currentUserId ?? 0,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.message),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => MentorChatScreen(
//                                       currentUserId: currentUserId.toString(),
//                                       mentorId: mentor.id.toString(),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar:  BottomNavBar(currentIndex: 3),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/StudentUser/BottonNavigationBar/navbar.dart';
import 'package:techmate/StudentUser/Chats/Mentorchat.dart';
import 'package:techmate/StudentUser/MentorScreen/bookings.dart';
import 'package:techmate/providers/BookingProvider.dart';
import 'package:techmate/services/Mentor/getmentor.dart';

import 'mentorprofile.dart';

class MentorsScreen extends StatefulWidget {
  static const String routeName = 'mentor screen';

  const MentorsScreen({super.key});

  @override
  _MentorsScreenState  createState() => _MentorsScreenState();
}

class _MentorsScreenState extends State<MentorsScreen> {
  late Future<List<Mentor>> _futureMentors;
  int? currentUserId;
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _futureMentors = MentorService().getMentors();
    _getCurrentUserId();
  }

  Future<void> _getCurrentUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('national_id');
    setState(() {
      currentUserId = userId;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find a Mentor', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.event_note, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingsScreen(studentId: currentUserId ?? 0),
                ),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search by area of interest...',
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      _searchText = '';
                      _futureMentors = MentorService().getMentors(); // Reset to all mentors
                    });
                  },
                ),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Mentor>>(
              future: _searchText.isEmpty
                  ? _futureMentors
                  : MentorService().searchMentorsByAreaOfInterest(_searchText),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No mentors found'));
                } else {
                  List<Mentor> filteredMentors = snapshot.data!;

                  return ListView.builder(
                    itemCount: filteredMentors.length,
                    itemBuilder: (context, index) {
                      final mentor = filteredMentors[index];
                      final String firstLetter = mentor.firstname.isNotEmpty
                          ? mentor.firstname[0]
                          : '';

                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.blue[800],
                            child: CircleAvatar(
                              radius: 23,
                              backgroundColor: Colors.white,
                              child: Text(
                                firstLetter,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.blue[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          title: Text('${mentor.firstname} ${mentor.lastname}'),
                          subtitle: Text(mentor.jobtitle),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.visibility, color: Color.fromARGB(255, 48, 134, 232)),
                                onPressed: () {
                                  bookingProvider.setMentorId(mentor.id);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MentorProfileScreen(
                                        mentor: mentor,
                                        currentUserId: currentUserId ?? 0,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.message, color: Color.fromARGB(255, 48, 134, 232)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MentorChatScreen(
                                        currentUserId: currentUserId.toString(),
                                        mentorId: mentor.id.toString(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 3),
    );
  }
}
