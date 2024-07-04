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
  _MentorExperienceScreenState createState() => _MentorExperienceScreenState();
}

class _MentorExperienceScreenState extends State<MentorExperienceScreen> {
  final ApiService apiService = ApiService();
  List experiences = [];
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
        List fetchedExperiences = await apiService.fetchMentorExperience(mentorId!);
        setState(() {
          experiences = fetchedExperiences;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text('Mentor Experience'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Experiences',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(experiences[index] ?? 'No experience provided'),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
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
                child: Text('Add Experience'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
