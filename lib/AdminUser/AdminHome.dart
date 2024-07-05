import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/AdminUser/internshipdetails.dart';
import 'package:techmate/services/AdminScreens/SearchInternshipApi.dart';
import 'package:techmate/services/AdminScreens/getAllIinternsforadmin.dart';
import 'package:techmate/services/AdminScreens/deleteinternshipService.dart';
import 'package:techmate/Registeration/login/login.dart'; // Import the login screen

class AdminHomeScreen extends StatefulWidget {
  static const String routeName = 'admin_home_screen';
  const AdminHomeScreen({Key? key});

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Internship> _internships = [];
  List<Internship> _filteredInternships = [];
  bool _isLoading = true;
  final FetchAllInternshipsService _fetchAllInternshipsService = FetchAllInternshipsService();
  final SearchInternshipsService _searchInternshipsService = SearchInternshipsService();
  final DeleteInternshipService _deleteInternshipService = DeleteInternshipService();

  @override
  void initState() {
    super.initState();
    _fetchInternships();
    _searchController.addListener(_filterInternships);
  }

  Future<int?> getNationalId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('national_id');
  }

  void _fetchInternships() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final nationalId = await getNationalId();
      if (nationalId == null) {
        throw Exception('National ID not found');
      }

      print('Fetching internships...');
      List<Internship> internships = await _fetchAllInternshipsService.fetchAllInternships();
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
    final nationalId = await getNationalId();
    if (nationalId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('National ID not found. Please login again.')),
      );
      return;
    }

    if (query.isEmpty) {
      setState(() {
        _filteredInternships = _internships;
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      List<Internship> internships = await _searchInternshipsService.searchInternships(query);
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
        builder: (context) => InternshipDetails(internship: internship),
      ),
    );
  }

  void _deleteInternship(int internId) async {
    final nationalId = await getNationalId();
    if (nationalId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('National ID not found. Please login again.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      bool success = await _deleteInternshipService.deleteInternship(internId);

      if (success) {
        setState(() {
          _internships.removeWhere((internship) => internship.internId == internId);
          _filteredInternships.removeWhere((internship) => internship.internId == internId);
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Internship deleted successfully')),
        );
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete internship')),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Failed to delete internship: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete internship')),
      );
    }
  }

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('national_id'); // Clear any stored user information

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => login_screen()),
    );
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
                  onTap: () => _showInternshipDetails(context, internship),
                  onDelete: () => _deleteInternship(internship.internId),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward_ios),
            label: 'Log out',
          ),
        ],
        selectedItemColor: Colors.blue[800],
        onTap: (index) {
          if (index == 1) {
            _logout();
          }
        },
      ),
    );
  }
}

class InternshipCard extends StatelessWidget {
  final Internship internship;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const InternshipCard({
    required this.internship,
    required this.onTap,
    required this.onDelete,
  });

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
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            internship.internTitle,
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            '${internship.city}, ${internship.country}',
                            style: TextStyle(fontSize: 14.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: onDelete,
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  internship.companyName,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Duration: ${internship.duration}',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
