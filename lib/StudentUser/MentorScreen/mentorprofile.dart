import 'package:flutter/material.dart';
import 'package:techmate/StudentUser/BottonNavigationBar/navbar.dart';
import 'package:techmate/StudentUser/Chats/Mentorchat.dart';
import 'package:techmate/services/Mentor/enrollment.dart';
import 'package:techmate/services/Mentor/getmentor.dart';
import 'package:techmate/services/profile/profileUpdateApiService.dart';

import 'bookmeeting.dart';

class MentorProfileScreen extends StatelessWidget {
  final Mentor mentor;
  final ProfileUpdateApiService profileService = ProfileUpdateApiService();
  final int currentUserId;
  final EnrollService enrollService =
  EnrollService(); // Initialize EnrollService

  MentorProfileScreen({
    Key? key,
    required this.mentor,
    required this.currentUserId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        const Text('Mentor Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
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
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: mentor.imageUrl != null
                          ? NetworkImage(mentor.imageUrl!)
                          : null,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${mentor.firstname} ${mentor.lastname}',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      mentor.jobtitle,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Experience',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    FutureBuilder<List<String>>(
                      future: _fetchMentorExperiences(mentor.id.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: snapshot.data!.map((experience) {
                              return Text(
                                experience,
                                textAlign: TextAlign.center,
                              );
                            }).toList(),
                          );
                        } else if (snapshot.hasError) {
                          return const Text(
                            'Failed to load experiences',
                            textAlign: TextAlign.center,
                          );
                        } else {
                          return const CircularProgressIndicator(); // Or placeholder widget
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectDateTimeScreen(
                              mentor: mentor,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Book Meeting',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        bool enrolled =
                        await EnrollService.enrollStudentWithMentor(
                          currentUserId, // Assuming currentUserId is student ID
                          mentor.id, // Mentor ID
                        );

                        if (enrolled) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Enrolled successfully')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Failed to enroll')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Enroll with Mentor',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:  BottomNavBar(currentIndex: 3),
      floatingActionButton: FloatingActionButton(
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
        backgroundColor: Colors.blue[800],
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<List<String>> _fetchMentorExperiences(String id) async {
    try {
      final response = await profileService.getMentorExperiences(id);

      if (response != null) {
        List<String> experiences =
        List<String>.from(response.map((exp) => exp['Experience']));
        return experiences;
      } else {
        return []; // Return empty list or handle error based on your app's logic
      }
    } catch (e) {
      print('Error fetching mentor experiences: $e');
      return []; // Handle error as needed
      }
    }
}