// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techmate/services/MentorScreens/MentorApis.dart';
// import 'package:techmate/MentorUser/addexperience.dart';
//
// class MentorDashboardApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primaryColor: Colors.blue[800],
//         appBarTheme: AppBarTheme(
//           color: Colors.blue[800],
//         ),
//         bottomNavigationBarTheme: BottomNavigationBarThemeData(
//           selectedItemColor: Colors.blue[800],
//         ),
//       ),
//       home: MentorExperienceScreen(),
//     );
//   }
// }
//
// class MentorExperienceScreen extends StatefulWidget {
//   @override
//   _MentorExperienceScreenState createState() => _MentorExperienceScreenState();
// }
//
// class _MentorExperienceScreenState extends State<MentorExperienceScreen> {
//   final ApiService apiService = ApiService();
//   List<Map<String, dynamic>> experiences = [];
//   int? mentorId;
//
//   @override
//   void initState() {
//     super.initState();
//     getMentorId();
//   }
//
//   Future<void> getMentorId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int? id = prefs.getInt('national_id');
//     setState(() {
//       mentorId = id;
//     });
//     if (mentorId != null) {
//       fetchExperiences();
//     }
//   }
//
//   fetchExperiences() async {
//     try {
//       if (mentorId != null) {
//         List fetchedExperiences = await apiService.fetchMentorExperience(mentorId!);
//         setState(() {
//           experiences = List<Map<String, dynamic>>.from(fetchedExperiences);
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   void _confirmDeleteExperience(BuildContext context, int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Confirm Deletion'),
//           content: Text('Are you sure you want to delete this experience?'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 _deleteExperience(index);
//                 Navigator.of(context).pop();
//               },
//               child: Text('Delete'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _deleteExperience(int index) async {
//     try {
//       await apiService.deleteMentorExperience(mentorId!, experiences[index]['Experience']);
//       setState(() {
//         experiences.removeAt(index);
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mentor Experience', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blue[800],
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Experiences',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[800]),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: experiences.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: ListTile(
//                       title: Text(experiences[index]['Experience'] ?? 'No experience provided'),
//                       trailing: IconButton(
//                         icon: Icon(Icons.delete, color: Colors.black),
//                         onPressed: () {
//                           _confirmDeleteExperience(context, index);
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddExperienceScreen(),
//             ),
//           ).then((value) {
//             if (value == true) {
//               fetchExperiences();
//             }
//           });
//         },
//         child: Icon(Icons.add, color: Colors.white),
//         backgroundColor: Colors.blue[800],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/services/MentorScreens/MentorApis.dart';
import 'package:techmate/MentorUser/addexperience.dart';

class MentorDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[800],
        appBarTheme: AppBarTheme(
          color: Colors.blue[800],
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.blue[800],
        ),
      ),
      home: MentorExperienceScreen(),
    );
  }
}

class MentorExperienceScreen extends StatefulWidget {
  @override
  _MentorExperienceScreenState  createState() =>
      _MentorExperienceScreenState();
}

class _MentorExperienceScreenState extends State<MentorExperienceScreen> {
  final ApiService apiService = ApiService();
  List<Map<String, dynamic>> experiences = [];
  int? mentorId;

  @override
  void initState() {
    super.initState();
    getMentorId();
  }

  Future<void> getMentorId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('national_id');
    setState(() {
      mentorId = id;
    });
    if (mentorId != null) {
      fetchExperiences();
    }
  }

  fetchExperiences() async {
    try {
      if (mentorId != null) {
        List fetchedExperiences =
        await apiService.fetchMentorExperience(mentorId!);
        setState(() {
          experiences = List<Map<String, dynamic>>.from(fetchedExperiences);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void _confirmDeleteExperience(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this experience?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteExperience(index);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteExperience(int index) async {
    try {
      await apiService.deleteMentorExperience(
          mentorId!, experiences[index]['Experience']);
      setState(() {
        experiences.removeAt(index);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.blue[800],
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 20.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mentor Experience',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Experiences',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800]),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(experiences[index]['Experience'] ??
                          'No experience provided'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.black),
                        onPressed: () {
                          _confirmDeleteExperience(context, index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddExperienceScreen(),
            ),
          ).then((value) {
            if (value == true) {
              fetchExperiences();
            }
          });
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue[800],
      ),
    );
  }
}
