import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget {
  @override
  _SavedScreenState  get createState => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  // Sample data (replace with your actual saved items data)
  List<Map<String, String>> savedItems = [
    {'type': 'internship', 'title': 'Internship 1', 'subtitle': 'Company A', 'image': 'https://example.com/internship1.jpg'},
    {'type': 'course', 'title': 'Course 1', 'subtitle': 'Instructor A', 'image': 'https://example.com/course1.jpg'},
    {'type': 'internship', 'title': 'Internship 2', 'subtitle': 'Company B', 'image': 'https://example.com/internship2.jpg'},
    {'type': 'course', 'title': 'Course 2', 'subtitle': 'Instructor B', 'image': 'https://example.com/course2.jpg'},
  ];

  String filterType = 'all';

  List<Map<String, String>> getFilteredItems() {
    if (filterType == 'all') {
      return savedItems;
    } else {
      return savedItems.where((item) => item['type'] == filterType).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredItems = getFilteredItems();

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Items',
        style:  TextStyle(color: Colors.white) ),
        backgroundColor: Colors.blue[800],
   ),


      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilterChip(
                  label: Text(
                    'All',
                    style: TextStyle(
                      color: filterType == 'all' ? Colors.white : Colors.blue[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: filterType == 'all',
                  selectedColor: Colors.blue[800],
                  backgroundColor: Colors.grey[200],
                  onSelected: (bool selected) {
                    setState(() {
                      filterType = 'all';
                    });
                  },
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text(
                    'Internships',
                    style: TextStyle(
                      color: filterType == 'internships' ? Colors.white : Colors.blue[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: filterType == 'internships',
                  selectedColor: Colors.blue[800],
                  backgroundColor: Colors.grey[200],
                  onSelected: (bool selected) {
                    setState(() {
                      filterType = 'internships';
                    });
                  },
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text(
                    'Courses',
                    style: TextStyle(
                      color: filterType == 'courses' ? Colors.white : Colors.blue[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: filterType == 'courses',
                  selectedColor: Colors.blue[800],
                  backgroundColor: Colors.grey[200],
                  onSelected: (bool selected) {
                    setState(() {
                      filterType = 'courses';
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    filteredItems[index]['image']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                  ),
                  title: Text(filteredItems[index]['title']!),
                  subtitle: Text(filteredItems[index]['subtitle']!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
