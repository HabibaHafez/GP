import 'package:flutter/material.dart';
import 'package:techmate/IntershipsScreen/application.dart';

class InternshipDetails extends StatelessWidget {
  final Map<String, dynamic> internship;

  const InternshipDetails({super.key, required this.internship});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(internship['Link'] ?? 'images/cs.jpeg'), // Ensure the image URL is correct
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            internship['InternTitle'] ?? 'No title', // Internship title
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            internship['CompanyName'] ?? 'No company', // Company name
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            internship['Location'] ?? 'No location', // Location info
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
                      '1 month ago', // Replace with actual posted time if available
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    Spacer(),
                    Text(
                      internship['WorkType'] ?? 'No work type', // Work type
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      internship['JobType'] ?? 'No job type', // Job type
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      internship['JobLevel'] ?? 'No job level', // Job level
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      internship['CompanySize'] ?? 'No company size', // Company size
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    Spacer(),
                    Text(
                      internship['Industry'] ?? 'No industry', // Industry
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  '6 of 10 skills match your profile - you may be a good fit', // Replace with actual skill match if available
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'See how you compare to over 100 other applicants.',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ApplyToInternshipScreen(),
                          ),
                        );
                      },
                      child: Text('Easy Apply'),
                    ),
                    SizedBox(width: 8.0),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blue[800]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Handle save button press
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.blue[800]),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Text(
                  'About the job',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  internship['JobDescription'] ?? 'No description available', // Job description
                ),
                Divider(),
                Text(
                  'Responsibilities',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  internship['Responsibilities'] ?? 'No responsibilities listed', // Responsibilities
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                Divider(),
                Text(
                  'Qualifications',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  internship['Qualifications'] ?? 'No qualifications listed', // Qualifications
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}