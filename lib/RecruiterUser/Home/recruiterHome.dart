import 'package:flutter/material.dart';
import 'package:techmate/Notification/notification.dart';
import 'package:techmate/RecruiterUser/BottomNavigationBar/navbar.dart';
import 'package:techmate/RecruiterUser/Home/AddInternshipScreen.dart';
import 'package:techmate/RecruiterUser/Home/internshipdetails.dart';
import 'package:techmate/services/RecruiterScreens/SearchInternshipApi.dart';
import 'package:techmate/services/RecruiterScreens/getAllinternsforRecuiter.dart';

class RecruiterInternshipsScreen extends StatefulWidget {
  static const String routeName = 'recruiter internship screen';
  const RecruiterInternshipsScreen({super.key});

  @override
  _RecruiterInternshipsScreenState  createState() =>
      _RecruiterInternshipsScreenState();
}

class _RecruiterInternshipsScreenState
    extends State<RecruiterInternshipsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Internship> _internships = [];
  List<Internship> _filteredInternships = [];
  bool _isLoading = true;
  final InternshipService _internshipService = InternshipService();
  final SearchInternApiService _searchInternApiService =
  SearchInternApiService();

  @override
  void initState() {
    super.initState();
    _fetchInternships();
    _searchController.addListener(_filterInternships);
  }

  void _fetchInternships() async {
    setState(() {
      _isLoading = true;
    });

    try {
      print('Fetching internships...');
      List<Internship> internships =
      await _internshipService.fetchInternships();
      print('Fetched internships: $internships');
      setState(() {
        _internships = internships;
        _filteredInternships = internships;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Failed to fetch internships: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch internships')),
      );
    }
  }

  void _filterInternships() async {
    final query = _searchController.text;
    if (query.isEmpty) {
      setState(() {
        _filteredInternships = _internships;
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      List<Internship> internships =
      await _searchInternApiService.searchInternships(query);
      setState(() {
        _filteredInternships = internships;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Failed to search internships: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to search internships')),
      );
    }
  }

  void _showInternshipDetails(BuildContext context, Internship internship) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            RecruiterInternshipDetails(internship: internship),
      ),
    );
  }

  void _navigateToAddInternshipScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddInternshipScreen()),
    ).then((value) {
      if (value != null && value is Internship) {
        setState(() {
          _internships.add(value);
          _filterInternships();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internships', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.notifications, color: Colors.white),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => NotificationScreen()),
        //       );
        //     },
        //   ),
        // ],
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
              ),
              onChanged: (_) => _filterInternships(),
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _filteredInternships.length,
              itemBuilder: (BuildContext context, int index) {
                final internship = _filteredInternships[index];
                return InternshipCard(
                  internship: internship,
                  onTap: () =>
                      _showInternshipDetails(context, internship),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddInternshipScreen(context);
        },
        tooltip: 'Add Internship',
        backgroundColor: Colors.blue[800],
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: RecruiterBottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}

class InternshipCard extends StatelessWidget {
  final Internship internship;
  final VoidCallback onTap;

  const InternshipCard({required this.internship, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // CircleAvatar(
                    //   radius: 25,
                    //   backgroundImage: NetworkImage(
                    //     internship.link ?? 'images/cs.jpeg',
                    //   ),
                    // ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            internship.internTitle,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            internship.companyName,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            internship.city,
                            style: TextStyle(color: Colors.grey[600]),
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
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        internship.date,
                        style: TextStyle(color: Colors.grey[600]),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        internship.paid == '1' ? 'Paid' : 'Unpaid',
                        style: TextStyle(color: Colors.green),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
