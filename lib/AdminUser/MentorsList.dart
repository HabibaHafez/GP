import 'package:flutter/material.dart';
import 'package:techmate/services/AdminScreens/deleteMentor.dart';
import 'package:techmate/services/MentorScreens/rating.dart';

class MentorListScreen extends StatefulWidget {
  @override
  _MentorListScreenState createState() => _MentorListScreenState();
}

class _MentorListScreenState extends State<MentorListScreen> {
  final RatingService _ratingService = RatingService();
  final DeleteMentorService _deleteMentorService =
  DeleteMentorService(); // Instantiate DeleteMentorService
  late Future<List<MentorRating>> _mentorsFuture;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _mentorsFuture = _ratingService.getMentorsWithRatingsSorted();
  }

  // Method to handle mentor deletion
  void _deleteMentor(BuildContext context, int mentorId) async {
    try {
      await _deleteMentorService
          .deleteMentor(mentorId); // Call deleteMentor from DeleteMentorService
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mentor deleted successfully')),
      );
      // Optionally, refresh the mentors list after deletion:
      setState(() {
        _mentorsFuture = _ratingService.getMentorsWithRatingsSorted();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete mentor: $e')),
      );
    }
  }

  // Method to search mentors by AreaOfInterest
  void _searchMentors(String areaOfInterest) {
    setState(() {
      _mentorsFuture =
          _ratingService.searchMentorsByAreaOfInterest(areaOfInterest);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mentors with Ratings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by Area of Interest',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => _searchMentors(_searchController.text),
                ),
              ),
              onSubmitted: (value) => _searchMentors(value),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<MentorRating>>(
              future: _mentorsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No mentors found'));
                } else {
                  List<MentorRating> mentors = snapshot.data!;
                  return ListView.builder(
                    itemCount: mentors.length,
                    itemBuilder: (context, index) {
                      MentorRating mentor = mentors[index];
                      return Card(
                        elevation: 3,
                        margin:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: ListTile(
                          title: Text('${mentor.firstName} ${mentor.lastName}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4),
                              Text('Job Title: ${mentor.jobTitle}'),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 18),
                                  SizedBox(width: 4),
                                  Text(
                                      'Rating: ${mentor.averageRating ?? 'N/A'}'),
                                ],
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () =>
                                _deleteMentor(context, mentor.mentorId),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
