import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/services/profile/profileApiService.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:techmate/MentorUser/mentorexperience.dart'; // Import ExperienceScreen
import 'package:techmate/MentorUser/mentorareaofinterest.dart'; // Import AreaOfInterestScreen
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/MentorUser/editmentorprofile.dart'; // Import MentorEditProfileScreen
import 'package:techmate/MentorUser/mentorhome.dart'; // Import MentorHome

Future<int?> getNationalId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('national_id');
}

class MentorProfileScreen extends StatefulWidget {
  static const String routeName = 'mentor profile screen';

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
    if (nationalId != null) {
      setState(() {
        _nationalId = nationalId;
        _userProfile = _profileApiService.getUserProfile(_nationalId!);
        _loadUserImage();
      });
    } else {
      print("National ID is null");
      // Handle the case when the national ID is null, for example, show a message or redirect to login
    }
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
        _uploadImage(imageFile);
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> _uploadImage(File image) async {
    if (_image != null && _nationalId != null) {
      bool success = await _profileApiService.uploadUserImage(_nationalId!, image);
      if (success) {
        _loadUserImage();
        print('Image uploaded successfully');
      } else {
        print('Image upload failed');
      }
    }
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all saved data

    // Navigate to the login screen
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => login_screen()),
            (Route<dynamic> route) => false
    );
  }

  void _updateUserProfile() {
    setState(() {
      _userProfile = _profileApiService.getUserProfile(_nationalId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentor Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _nationalId == null
          ? Center(child: Text('National ID is null. Please log in again.'))
          : FutureBuilder<Map<String, dynamic>?>(
        future: _userProfile,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No user data found'));
          } else {
            final userProfile = snapshot.data!;
            final user = userProfile['user'];
            final mentor = userProfile['mentor'];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(_imageUrl),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blue[800],
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
                    leading: Icon(Icons.work, color: Colors.blue[800]), // Updated icon for Experience
                    title: Text('Experience'),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[800]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MentorExperienceScreen()), // Updated screen
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.interests, color: Colors.blue[800]),
                    title: Text('Area of Interest'),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[800]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AreaOfInterestScreen()), // Updated screen
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.edit_note_outlined, color: Colors.blue[800]),
                    title: Text('Edit Profile'),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[800]),
                    onTap: () async {
                      bool? result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MentorEditProfileScreen(
                          firstName: user['first_name'],
                          lastName: user['last_name'],
                          email: user['Email'],
                          phoneNumber: user['PhoneNumber'],
                          jobTitle: mentor['JobTitle'] ?? '',
                          company: mentor['Company'] ?? '',
                          price: mentor['Price']?.toString() ?? '0',
                          numberOfStudents: mentor['No_of_Students']?.toString() ?? '0',
                          password: user['Password'], // Added password field
                        )), // Reference MentorEditProfileScreen with data
                      );
                      if (result == true) {
                        _updateUserProfile(); // Update the profile after returning from edit screen
                      }
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Set the current index to 2 for highlighting Profile tab
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          if (index != 2) { // Disable press on Profile tab
            switch (index) {
              case 0:
              // Navigate to Home screen
                Navigator.push(context, MaterialPageRoute(builder: (context) => MentorHome())); // Updated Home screen
                break;
              case 1:
              // Navigate to Chat screen
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                break;
            }
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

class MentorHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
