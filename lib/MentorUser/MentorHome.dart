// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:techmate/services/MentorScreens/MentorApis.dart'; // Ensure this path is correct
// import 'mentorprofile.dart'; // Ensure this path is correct
// import 'package:techmate/MentorUser/NavBar.dart';
// import 'package:techmate/MentorUser/ChatScreen.dart';
//
// class MentorHome extends StatefulWidget {
//   static const routeName = '/Mentorhome';
//
//   @override
//   _MentorHomeState createState() => _MentorHomeState();
// }
//
// class _MentorHomeState extends State<MentorHome> {
//   final ApiService apiService = ApiService();
//   int studentCount = 0;
//   List<Map<String, dynamic>> students = [];
//   List<Map<String, dynamic>> meetings = [];
//   int? mentorId;
//   int _selectedIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     getNationalId().then((id) {
//       if (id != null) {
//         setState(() {
//           mentorId = id;
//         });
//         fetchStudentCount(id);
//         fetchStudents(id);
//         fetchMeetings(id);
//       } else {
//         print('National ID not found');
//       }
//     });
//   }
//
//   Future<int?> getNationalId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getInt('national_id');
//   }
//
//   Future<void> fetchStudentCount(int mentorId) async {
//     try {
//       int count = await apiService.fetchStudentCount(mentorId);
//       setState(() {
//         studentCount = count;
//       });
//     } catch (e) {
//       print('Error fetching student count: $e');
//     }
//   }
//
//   Future<void> fetchStudents(int mentorId) async {
//     try {
//       List<Map<String, dynamic>> studentsList = await apiService.fetchStudents(mentorId);
//       setState(() {
//         students = studentsList;
//       });
//     } catch (e) {
//       print('Error fetching students: $e');
//     }
//   }
//
//   Future<void> fetchMeetings(int mentorId) async {
//     try {
//       List<Map<String, dynamic>> meetingsList = await apiService.fetchMeetings(mentorId);
//       setState(() {
//         meetings = meetingsList;
//       });
//     } catch (e) {
//       print('Error fetching meetings: $e');
//     }
//   }
//
//   void showStudentDetails(BuildContext context, Map<String, dynamic> student) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Name: ${student['first_name']} ${student['last_name']}',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               Text('Email: ${student['Email'] ?? 'N/A'}', style: TextStyle(fontSize: 16)),
//               SizedBox(height: 10),
//               Text('Skills: ${student['Skills'] ?? 'N/A'}', style: TextStyle(fontSize: 16)),
//               SizedBox(height: 10),
//               Text('Level: ${student['Level'] ?? 'N/A'}', style: TextStyle(fontSize: 16)),
//               SizedBox(height: 10),
//               Text('University: ${student['University'] ?? 'N/A'}', style: TextStyle(fontSize: 16)),
//               SizedBox(height: 10),
//               Text('Faculty: ${student['Faculty'] ?? 'N/A'}', style: TextStyle(fontSize: 16)),
//               SizedBox(height: 10),
//               Text('Location: ${student['Country'] ?? 'N/A'}, ${student['City'] ?? 'N/A'}', style: TextStyle(fontSize: 16)),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[800],
//         title: Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             'Home',
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Students Count: $studentCount',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 20),
//             Text('Students:',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10), // Add some space before the students list
//             Expanded(
//               child: ListView.builder(
//                 itemCount: students.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     margin: EdgeInsets.symmetric(vertical: 8.0),
//                     child: ListTile(
//                       title: Text(
//                         '${students[index]['first_name']} ${students[index]['last_name']}' ?? 'No Name',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Text(
//                         students[index]['Email'] ?? 'No Email',
//                         style: TextStyle(color: Colors.grey[600]),
//                       ),
//                       trailing: IconButton(
//                         icon: Icon(Icons.more_vert),
//                         onPressed: () {
//                           showStudentDetails(context, students[index]);
//                         },
//                       ),
//                       onTap: () {
//                         showStudentDetails(context, students[index]);
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             Text('Upcoming Meetings:',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10), // Add some space before the meetings list
//             Expanded(
//               child: ListView.builder(
//                 itemCount: meetings.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     margin: EdgeInsets.symmetric(vertical: 8.0),
//                     child: ListTile(
//                       title: Text(
//                         'Student: ${meetings[index]['Student_Name'] ?? 'No Name'}',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Text(
//                         'Date: ${meetings[index]['Date']} - Time: ${meetings[index]['Time']}',
//                         style: TextStyle(color: Colors.grey[600]),
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
//           currentIndex:0,
//           ),
//     );
//   }
// }
//



import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/services/MentorScreens/MentorApis.dart';
import 'mentorprofile.dart';
import 'package:techmate/MentorUser/NavBar.dart';
import 'package:techmate/MentorUser/ChatScreen.dart';
import 'package:intl/intl.dart'; // for date formatting

class MentorHome extends StatefulWidget {
  static const routeName = '/Mentorhome';

  @override
  _MentorHomeState  createState() => _MentorHomeState();
}

class _MentorHomeState extends State<MentorHome> {
  final ApiService apiService = ApiService();
  int studentCount = 0;
  List<Map<String, dynamic>> students = [];
  List<Map<String, dynamic>> meetings = [];
  int? mentorId;
  String mentorName = "Mentor"; // Replace with actual mentor name
  int _selectedIndex = 0;

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
      List<Map<String, dynamic>> studentsList =
      await apiService.fetchStudents(mentorId);
      setState(() {
        students = studentsList;
      });
    } catch (e) {
      print('Error fetching students: $e');
    }
  }

  Future<void> fetchMeetings(int mentorId) async {
    try {
      List<Map<String, dynamic>> meetingsList =
      await apiService.fetchMeetings(mentorId);
      setState(() {
        meetings = meetingsList;
      });
    } catch (e) {
      print('Error fetching meetings: $e');
    }
  }

  void toggleStudentDetails(int index) {
    setState(() {
      students[index]['isExpanded'] = !(students[index]['isExpanded'] ?? false);
    });
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('d\nMMMM').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.blue[800],
          title: Padding(
            padding: const EdgeInsets.only(left: 7.0, top: 30.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome, $mentorName',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.people, color: Colors.blue[800], size: 30),
                  SizedBox(width: 6),
                  Text(' Enrolled Students ',
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Text('Total: $studentCount',
                        style:
                        TextStyle(fontSize: 14, color: Colors.grey[700])),
                  ),
                ],
              ),
              SizedBox(height: 10),
              studentsSection(),
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(Icons.event, color: Colors.blue[800], size: 30),
                  SizedBox(width: 10),
                  Text('Upcoming Meetings',
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 20),
              meetingsSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
      ),
    );
  }

  Widget studentsSection() {
    return students.isNotEmpty
        ? Column(
      children: students.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> student = entry.value;
        bool isExpanded = student['isExpanded'] ?? false;
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.blue[800]!, width: 1),
          ),
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: () => toggleStudentDetails(index),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      student['first_name'][0],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    '${student['first_name']} ${student['last_name']}' ??
                        'No Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    student['Email'] ?? 'No Email',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                  ),
                ),
                if (isExpanded)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        detailRow(Icons.code, 'Skills: ',
                            student['Skills'] ?? 'N/A'),
                        SizedBox(height: 10),
                        detailRow(Icons.school, 'Level: ',
                            student['Level'].toString() ?? 'N/A'),
                        SizedBox(height: 10),
                        detailRow(Icons.location_city, 'University: ',
                            student['University'] ?? 'N/A'),
                        SizedBox(height: 10),
                        detailRow(Icons.account_balance, 'Faculty: ',
                            student['Faculty'] ?? 'N/A'),
                        // SizedBox(height: 10),
                        // detailRow(Icons.location_on, 'Location: ',
                        //     '${student['Country'] ?? 'N/A'}, ${student['City'] ?? 'N/A'}'),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    )
        : Center(child: Text('No students enrolled'));
  }

  Widget detailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.blue[800]),
        SizedBox(width: 8),
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
          child: Text(value),
        ),
      ],
    );
  }

  Widget meetingsSection() {
    return meetings.isNotEmpty
        ? Column(
      children: meetings.map((meeting) {
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.blue[800]!, width: 1),
          ),
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 20.0, horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  meeting['Time'] ?? '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                VerticalDivider(
                  color: Colors.black,
                  width: 20,
                  thickness: 1,
                  indent: 5,
                  endIndent: 5,
                ),
                Expanded(
                  child: Text(
                    'Student: ${meeting['Student_Name'] ?? 'No Name'}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                VerticalDivider(
                  color: Colors.black,
                  width: 20,
                  thickness: 1,
                  indent: 5,
                  endIndent: 5,
                ),
                Column(
                  children: [
                    Text(
                      DateFormat('d')
                          .format(DateTime.parse(meeting['Date'])),
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('MMMM')
                          .format(DateTime.parse(meeting['Date'])),
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    )
        : Center(child: Text('No upcoming meetings'));
  }
}
