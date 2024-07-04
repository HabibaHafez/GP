import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:techmate/services/MentorScreens/MentorApis.dart';
import 'mentorprofile.dart';// s in the same directory or update the path accordingly

class MentorHome extends StatefulWidget {
  static const routeName = '/Mentorhome';
  @override
  _MentorHomeState createState() => _MentorHomeState();
}

class _MentorHomeState extends State<MentorHome> {
  final ApiService apiService = ApiService();
  int studentCount = 0;
  List<Map<String, dynamic>> students = [];
  List<Map<String, dynamic>> meetings = [];
  int? mentorId;

  @override
  void initState() {
    super.initState();
    getNationalId().then((id) {
      if (id != null) {
        setState(() {
          mentorId = id;
        });
        fetchStudentCount(id);
        fetchStudents(id);
        fetchMeetings(id);
      }
    });
  }

  Future<int?> getNationalId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('national_id');
  }

  Future<void> fetchStudentCount(int mentorId) async {
    try {
      int count = await apiService.fetchStudentCount(mentorId);
      setState(() {
        studentCount = count;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchStudents(int mentorId) async {
    try {
      List studentsList = await apiService.fetchStudents(mentorId);
      setState(() {
        students = List<Map<String, dynamic>>.from(studentsList);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchMeetings(int mentorId) async {
    try {
      List meetingsList = await apiService.fetchMeetings(mentorId);
      setState(() {
        meetings = List<Map<String, dynamic>>.from(meetingsList);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentor Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Student Count: $studentCount', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Students:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(students[index]['Student_Name']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.chat),
                          onPressed: () {
                            // Navigate to chat screen
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentDetail(
                                  student: students[index],
                                  meetings: meetings,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Upcoming Meetings:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: meetings.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Student: ${meetings[index]['Student_Name']}'),
                    subtitle: Text('Date: ${meetings[index]['Date']} - Time: ${meetings[index]['Time']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
            // Already on home screen
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => MentorProfileScreen()));
              break;
          }
        },
      ),
    );
  }
}

class StudentDetail extends StatelessWidget {
  final Map<String, dynamic> student;
  final List<Map<String, dynamic>> meetings;

  StudentDetail({required this.student, required this.meetings});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> studentMeetings = meetings
        .where((meeting) => meeting['Student_Name'] == student['Student_Name'])
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${student['Student_Name']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Meetings:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: studentMeetings.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        'Date: ${studentMeetings[index]['Date']} - Time: ${studentMeetings[index]['Time']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Center(
        child: Text('Chat Screen'),
      ),
    );
  }
}


