import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/services/profile/profileApiService.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:techmate/BottonNavigationBar/navbar.dart';
import 'package:techmate/Notification/notification.dart';
import 'package:techmate/ProfileScreen/editprofile.dart';
import 'package:techmate/ProfileScreen/skills.dart';
import 'package:techmate/ProfileScreen/Saved.dart';
import 'package:techmate/Registeration/login/login.dart';

Future<int?> getNationalId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('national_id');
}

class ProfileScreen extends StatefulWidget {
  static const String routeName = 'profile screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
        ],
      ),
      body: _nationalId == null
          ? Center(child: CircularProgressIndicator())
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
                    leading: Icon(Icons.code, color: Colors.blue[800]),
                    title: Text('Skills'),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[800]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SkillsScreen()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.edit_note_outlined, color: Colors.blue[800]),
                    title: Text('Edit Profile'),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[800]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.save_alt_outlined, color: Colors.blue[800]),
                    title: Text('Saved'),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[800]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SavedScreen()),
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
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4,
      ),
    );
  }
}



