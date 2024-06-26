import 'package:flutter/material.dart';
import 'package:techmate/IntershipsScreen/application.dart';

class InternshipDetails extends StatelessWidget {
  final int index;
  const InternshipDetails({super.key, required this.index});

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
                      backgroundImage: AssetImage('images/cs.jpeg'), // Replace with the correct path or network image
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Position $index', // Replace with position name
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'Company $index', // Replace with company name
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'Cairo, Cairo, Egypt', // Replace with location info
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
                      '1 month ago', // Replace with actual posted time
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Remote', // Replace with actual work type
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Full-time', // Replace with actual job type
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Mid-Senior level', // Replace with actual job level
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
                      '51-200 employees', // Replace with actual company size
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    Spacer(),
                    Text(
                      'IT Services and IT Consulting', // Replace with actual industry
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  '6 of 10 skills match your profile - you may be a good fit', // Replace with actual skill match
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
                  'Dot-IT, a leading marketing company, is seeking a highly skilled and experienced Senior Web Developer to join our team. As a Senior Web Developer at Dot-IT, you will be responsible for developing and maintaining high-quality, scalable web applications and solutions.',
                ),
                SizedBox(height: 8.0),
                Text(
                  'In this role, you will collaborate with cross-functional teams to understand project requirements and develop innovative web solutions. You will write clean, efficient code using modern programming languages and frameworks, ensuring optimal performance and usability. Additionally, you will conduct thorough testing and debugging to ensure the reliability and functionality of web applications.',
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
                  '• Collaborate with cross-functional teams to understand project requirements and develop innovative web solutions.',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                // Add more responsibilities as needed
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
                  '6 of 10 skills match your profile - you may be a good fit',
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
