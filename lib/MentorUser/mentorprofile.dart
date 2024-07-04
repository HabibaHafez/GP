import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/Mentoruser/editmentorprofile.dart';
import 'package:techmate/services/profile/profileApiService.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:techmate/MentorUser/mentorexperience.dart';
import 'package:techmate/Registeration/login/login.dart';

Future<int?> getNationalId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('national_id');
}

class MentorProfileScreen extends StatefulWidget {
  static const String routeName = 'Mentor profile screen';

  @override
  _MentorProfileScreenState createState() => _MentorProfileScreenState();
}

class _MentorProfileScreenState extends State<MentorProfileScreen> {
  late Future<Map<String, dynamic>?> _userProfile;
  int? _nationalId;
  File? _image;
  String _imageUrl = 'https://example.com/profile.jpg'; // Default image URL
  final ImagePicker _picker = ImagePicker();
  final ProfileApiService _profileApiService = ProfileApiService();

  @override
  void initState() {
    super.initState();
    _loadNationalId();
  }

  void _loadNationalId() async {
    int? nationalId = await getNationalId();
    setState(() {
      _nationalId = nationalId;
      if (_nationalId != null) {
        _userProfile = _profileApiService.getUserProfile(_nationalId!);
        _loadUserImage();
      }
    });
  }

  void _loadUserImage() async {
    if (_nationalId != null) {
      String? imageUrl = await _profileApiService.fetchUserImageUrl(_nationalId!);
      setState(() {
        if (imageUrl != null && imageUrl.isNotEmpty) {
          _imageUrl = imageUrl;
        }
      });
    }
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        setState(() {
          _image = imageFile;
        });
        if (_nationalId != null) {
          await _profileApiService.uploadUserImage(_nationalId!, imageFile);
          _loadUserImage();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('national_id');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => login_screen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text('Profile'),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _userProfile,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          } else {
            final user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(_imageUrl),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: CircleAvatar(
                            backgroundColor: Colors.blue[800],
                            radius: 20,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    '${user['first_name']} ${user['last_name']}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24),
                  ListTile(
                    leading: Icon(Icons.edit_note_outlined, color: Colors.blue[800]),
                    title: Text('Edit Profile'),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[800]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MentorEditProfileScreen()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.work_outline, color: Colors.blue[800]),
                    title: Text('Experience'),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[800]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MentorExperienceScreen()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.blue[800]),
                    title: Text('Log Out'),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[800]),
                    onTap: _logout,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
