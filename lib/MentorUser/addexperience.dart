import 'package:flutter/material.dart';
import 'package:techmate/services/MentorScreens/MentorApis.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddExperienceScreen extends StatefulWidget {
  @override
  _AddExperienceScreenState createState() => _AddExperienceScreenState();
}

class _AddExperienceScreenState extends State<AddExperienceScreen> {
  final ApiService apiService = ApiService();
  final TextEditingController experienceController = TextEditingController();
  int? mentorId;

  @override
  void initState() {
    super.initState();
    getMentorId();
  }

  Future<void> getMentorId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      mentorId = prefs.getInt('national_id');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Experience'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: experienceController,
              decoration: InputDecoration(
                labelText: 'Experience',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () async {
                  if (experienceController.text.isNotEmpty && mentorId != null) {
                    try {
                      await apiService.addMentorExperience(mentorId!, experienceController.text);
                      Navigator.pop(context, true);
                    } catch (e) {
                      print('Error adding experience: $e');
                    }
                  }
                },
                child: Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
