import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> topSearches = [
    'Mobile App Development',
    'UX Design',
    'Excel',
    'Web Development',
    'AI',
    'Python',
    'Machine Learning'
  ];

  final List<String> categories = ['Courses', 'Internships', 'Mentors'];
  Map<String, bool> selectedCategories = {};

  @override
  void initState() {
    super.initState();
    for (var category in categories) {
      selectedCategories[category] = true; // Default to true as per screenshot
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications button press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for courses and internships',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: topSearches.map((search) {
                return ElevatedButton(
                  onPressed: () {
                    // Handle search button press
                  },
                  child: Text(search),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue[800], backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Browse by Categories', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ...categories.map((category) {
                  return CheckboxListTile(
                    title: Text(category),
                    value: selectedCategories[category],
                    onChanged: (bool? value) {
                      setState(() {
                        selectedCategories[category] = value!;
                      });
                    },
                    activeColor: Colors.blue[800],
                  );
                }).toList(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle show results button press
              },
              child: Text('SHOW RESULTS'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Internships',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mentors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: 2, // Set the default selected index (Home)
        onTap: (index) {
          // Handle bottom navigation bar item taps
        },
      ),
    );
  }
}


