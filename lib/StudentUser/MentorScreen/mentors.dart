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

  const MentorsScreen({Key? key}) : super(key: key);

  @override
  _MentorsScreenState createState() => _MentorsScreenState();
}

class _MentorsScreenState extends State<MentorsScreen> {
  late Future<List<Mentor>> _futureMentors;
  int? currentUserId;

  @override
  void initState() {
    super.initState();
    _futureMentors = MentorService().getMentors();
    _getCurrentUserId();
  }

  Future<void> _getCurrentUserId() async {
    // Retrieve the current user ID from SharedPreferences
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
        title:
        const Text('Find a Mentor', style: TextStyle(color: Colors.white)),
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
                  builder: (context) =>
                      BookingsScreen(studentId: currentUserId ?? 0),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Your filter and search UI here
          Expanded(
            child: FutureBuilder<List<Mentor>>(
              future: _futureMentors,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No mentors found'));
                } else {
                  final mentors = snapshot.data!;
                  return ListView.builder(
                    itemCount: mentors.length,
                    itemBuilder: (context, index) {
                      final mentor = mentors[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: mentor.imageUrl != null
                              ? NetworkImage(mentor.imageUrl!)
                              : null,
                        ),
                        title: Text('${mentor.firstname} ${mentor.lastname}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(mentor.jobtitle),
                            Text('${mentor.price} price'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.visibility),
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
                              icon: const Icon(Icons.message),
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
                            IconButton(
                              icon: const Icon(Icons.star),
                              onPressed: () {
                                // Navigate to a screen where users can rate the mentor
                                // You can implement this functionality as per your requirements
                              },
                            ),
                          ],
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
      bottomNavigationBar:  BottomNavBar(currentIndex: 3),
    );
  }
}
