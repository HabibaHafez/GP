import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:techmate/services/AdminScreens/getAllIinternsforadmin.dart'; // Assuming Internship class is defined here

class InternshipDetails extends StatelessWidget {
  final Internship internship;

  const InternshipDetails({Key? key, required this.internship}) : super(key: key);

  Future<void> _apply(BuildContext context) async {
    final link = internship.link;
    if (link != null && link.isNotEmpty) {
      final uri = Uri.parse(link);
      print('Launching URL: $link');  // Logging the URL
      try {
        if (await canLaunch(uri.toString())) {
          await launch(uri.toString(), forceSafariVC: false, forceWebView: false);
          print('Successfully launched URL');
        } else {
          print('Could not launch URL: $link');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch $link')),
          );
        }
      } catch (e) {
        print('Error launching URL: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error launching URL: $e')),
        );
      }
    } else {
      print('No link available for this internship');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No link available for this internship')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          internship.internTitle ?? 'Internship Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                          internship.internTitle ?? 'No title',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          internship.companyName ?? 'No company',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          internship.city ?? 'No location',
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
                  Flexible(
                    child: Text(
                      internship.date ?? 'Posted date not available', // Replace with actual posted time if available
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    child: Text(
                      internship.paid ?? 'No compensation info', // Compensation info
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      internship.duration ?? 'No duration specified', // Job duration
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                'Requirements',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                internship.requirements ?? 'No requirements listed', // Requirements
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
                onPressed: () => _apply(context),
                child: Text('Apply'),
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
                internship.description ?? 'No description available', // Job description
              ),
            ],
          ),
        ),
      ),
    );
  }
}
