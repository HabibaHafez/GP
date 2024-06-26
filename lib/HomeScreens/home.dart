import 'package:flutter/material.dart';
import 'package:techmate/BottonNavigationBar/navbar.dart';
import 'package:techmate/MentorScreen/mentors.dart';
import 'package:techmate/ProfileScreen/Saved.dart';
import 'package:techmate/ProfileScreen/profile.dart';
import 'search.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home screen';
  @override
  _HomeScreenState  get createState => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  // Sample data for saved items
  final List<Map<String, String>> _savedItems = [
    {'type': 'internship', 'title': 'Web Development Intern', 'image': 'https://example.com/internship1.jpg'},
    {'type': 'course', 'title': 'Flutter Development', 'image': 'https://example.com/course1.jpg'},
    {'type': 'internship', 'title': 'Data Science Intern', 'image': 'https://example.com/internship2.jpg'},
    {'type': 'course', 'title': 'React Native', 'image': 'https://example.com/course2.jpg'},
    {'type': 'course', 'title': 'Machine Learning', 'image': 'https://example.com/course3.jpg'},
  ];

  String _selectedFilter = 'all';

  List<Map<String, String>> _getFilteredSavedItems() {
    if (_selectedFilter == 'all') {
      return _savedItems.take(2).toList(); // Show the latest 2-3 items
    } else {
      return _savedItems
          .where((item) => item['type'] == _selectedFilter)
          .take(3)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, Habiba Hafez', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications tap
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for courses and internships',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              ),
              readOnly: true, // Makes the TextField read-only
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Recommended for you',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          Container(
            height: 180,
            child: PageView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://example.com/image$index.jpg',
                          height: 80,
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                        ),
                        SizedBox(height: 8),
                        Text('Web Development', style: TextStyle(color: Colors.black)),
                        SizedBox(height: 4),
                        Text('Dell Technologies', style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Apply',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Courses',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          Container(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 160,
                  margin: EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://example.com/course$index.jpg',
                          height: 80,
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                        ),
                        SizedBox(height: 8),
                        Text('Course $index', style: TextStyle(color: Colors.black)),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Enroll',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Saved',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: _selectedFilter,
                  items: [
                    DropdownMenuItem(value: 'all', child: Text('All')),
                    DropdownMenuItem(value: 'internship', child: Text('Internships')),
                    DropdownMenuItem(value: 'course', child: Text('Courses')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedFilter = value!;
                    });
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SavedScreen()),
                    );
                  },
                  child: Text('Show More'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: _getFilteredSavedItems().map((item) {
                return ListTile(
                  leading: Image.network(
                    item['image']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                  ),
                  title: Text(item['title']!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SavedScreen()),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
      ),
    );
  }
}
