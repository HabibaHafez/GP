import 'package:flutter/material.dart';
import 'package:techmate/BottonNavigationBar/Navigationbar.dart';
import 'package:techmate/IntershipsScreen/application.dart';
import 'package:techmate/IntershipsScreen/internship_details.dart';
import 'package:techmate/Notification/notification.dart';

class InternshipsScreen extends StatelessWidget {
  static const String routeName = 'internship screen';
  const InternshipsScreen({super.key});
  void _showInternshipDetails(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return InternshipDetails(index: index);
      },
    );
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
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search for internships',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with your data length
              itemBuilder: (BuildContext context, int index) {
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
                          _showInternshipDetails(context, index);
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
                                    backgroundImage: AssetImage(
                                        'images/cs.jpeg'), // Replace with the correct path or network image
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Flutter Developer $index', // Replace with position name
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
                                          'Location $index', // Replace with location info
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ApplyToInternshipScreen(),
                                    ),
                                  );
                                },
                                child: Text('Apply'),
                              ),
                            ],
                          ),
                        ),
                      )),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
      ),
    );
  }
}
