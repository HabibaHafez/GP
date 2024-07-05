import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:techmate/services/MentorScreens/MentorApis.dart'; // Ensure this path is correct
import 'mentorprofile.dart'; // Ensure this path is correct

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
      } else {
        print('National ID not found');
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
      print('Error fetching student count: $e');
    }
  }

  Future<void> fetchStudents(int mentorId) async {
    try {
      List<Map<String, dynamic>> studentsList = await apiService.fetchStudents(mentorId);
      setState(() {
        students = studentsList;
      });
    } catch (e) {
      print('Error fetching students: $e');
    }
  }

  Future<void> fetchMeetings(int mentorId) async {
    try {
      List<Map<String, dynamic>> meetingsList = await apiService.fetchMeetings(mentorId);
      setState(() {
        meetings = meetingsList;
      });
    } catch (e) {
      print('Error fetching meetings: $e');
    }
  }

  void showStudentDetails(BuildContext context, Map<String, dynamic> student) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: ${student['first_name']} ${student['last_name']}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('Email: ${student['Email'] ?? 'N/A'}', style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text('Skills: ${student['Skills'] ?? 'N/A'}', style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text('Level: ${student['Level'] ?? 'N/A'}', style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text('University: ${student['University'] ?? 'N/A'}', style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text('Faculty: ${student['Faculty'] ?? 'N/A'}', style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text('Location: ${student['Country'] ?? 'N/A'}, ${student['City'] ?? 'N/A'}', style: TextStyle(fontSize: 16)),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Align(
          alignment: Alignment.center,
          child: Text('Home', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Students Count: $studentCount',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Students:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        '${students[index]['first_name']} ${students[index]['last_name']}' ?? 'No Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        students[index]['Email'] ?? 'No Email',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {
                          showStudentDetails(context, students[index]);
                        },
                      ),
                      onTap: () {
                        showStudentDetails(context, students[index]);
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Upcoming Meetings:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: meetings.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        'Student: ${meetings[index]['Student_Name'] ?? 'No Name'}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Date: ${meetings[index]['Date']} - Time: ${meetings[index]['Time']}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
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
