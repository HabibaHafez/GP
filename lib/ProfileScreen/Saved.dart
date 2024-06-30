import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/services/savedApiService/savedapiservice.dart';
import 'package:techmate/shared%20attributes/shared.dart';

class SavedScreen extends StatefulWidget {
  @override
  _SavedScreenState get createState => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  savedApiService savedapiService = savedApiService();
  List<Map<String, dynamic>> savedItems = [];
  String filterType = 'all';

  @override
  void initState() {
    super.initState();
    _loadSavedItems();
  }

  void _loadSavedItems() async {
    try {
      int nationalId = 1234566209;
      print(nationalId);
      if (nationalId != null) {
        List<Map<String, dynamic>> courses =
            await savedapiService.getSavedCourses(nationalId);
        List<Map<String, dynamic>> internships =
            await savedapiService.getSavedInternships(nationalId);

        setState(() {
          savedItems = [...courses, ...internships];
        });
      } else {
        print('National ID not found');
        // Handle the case when national ID is not found
      }
    } catch (e) {
      print('Error loading saved items: $e');
      // Handle error
    }
  }

  List<Map<String, dynamic>> getFilteredItems() {
    if (filterType == 'all') {
      return savedItems;
    } else {
      return savedItems.where((item) => item['type'] == filterType).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredItems = getFilteredItems();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved Items',
          style: TextStyle(color: Colors.white),
        ),
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
                      color:
                          filterType == 'all' ? Colors.white : Colors.blue[800],
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
                      color: filterType == 'internship'
                          ? Colors.white
                          : Colors.blue[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: filterType == 'internship',
                  selectedColor: Colors.blue[800],
                  backgroundColor: Colors.grey[200],
                  onSelected: (bool selected) {
                    setState(() {
                      filterType = 'internship';
                    });
                  },
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text(
                    'Courses',
                    style: TextStyle(
                      color: filterType == 'course'
                          ? Colors.white
                          : Colors.blue[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: filterType == 'course',
                  selectedColor: Colors.blue[800],
                  backgroundColor: Colors.grey[200],
                  onSelected: (bool selected) {
                    setState(() {
                      filterType = 'course';
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
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Image.network(
                      filteredItems[index]['image']!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error),
                    ),
                    title: Text(filteredItems[index]['title']!),
                    subtitle: Text(filteredItems[index]['subtitle']!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
