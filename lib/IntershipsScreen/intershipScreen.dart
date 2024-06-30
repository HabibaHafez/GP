import 'package:flutter/material.dart';
import 'package:techmate/BottonNavigationBar/navbar.dart';
import 'package:techmate/IntershipsScreen/internship_details.dart';
import 'package:techmate/Notification/notification.dart';
import 'package:techmate/services/Home/intern_recommendations_service.dart';

class InternshipsScreen extends StatefulWidget {
  static const String routeName = 'internship screen';
  const InternshipsScreen({super.key});

  @override
  _InternshipsScreenState get createState => _InternshipsScreenState();
}

class _InternshipsScreenState extends State<InternshipsScreen> {
  final InternRecommendationsService _internService =
      InternRecommendationsService();
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> _internships = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchInternships();
  }

  Future<void> _fetchInternships({String? searchTerm}) async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<Map<String, dynamic>> internships = await _internService.fetchRecommendations(
        '1234566322', 
        searchTerm: searchTerm,
      );
      setState(() {
        _internships = internships;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load internships: $e')),
      );
    }
  }

  void _showInternshipDetails(BuildContext context, Map<String, dynamic> internship) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InternshipDetails(internship: internship),
      ),
    );
  }

  void _onSearch() {
    _fetchInternships(searchTerm: _searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Internships',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for internships',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _onSearch,
                ),
              ),
              onSubmitted: (_) => _onSearch(),
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _internships.length,
                    itemBuilder: (BuildContext context, int index) {
                      final internship = _internships[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: InkWell(
                            onTap: () {
                              _showInternshipDetails(context, internship);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundImage: NetworkImage(
                                          internship['Link'] ??
                                          'images/cs.jpeg',
                                        ), // Ensure the image URL is correct
                                      ),
                                      SizedBox(width: 16.0),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              internship['InternTitle'] ?? 'No title',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 4.0),
                                            Text(
                                              internship['CompanyName'] ?? 'No company',
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            SizedBox(height: 4.0),
                                            Text(
                                              internship['Location'] ?? 'No location',
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.more_vert),
                                        onPressed: () {
                                          // Handle menu button press
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Text(
                                        internship['Date'] ?? 'Posted date not available',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        internship['WorkType'] ?? 'No work type',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue[800],
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      _showInternshipDetails(context, internship);
                                    },
                                    child: Text('Apply'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
      ),
    );
  }
}
