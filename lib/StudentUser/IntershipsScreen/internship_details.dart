// import 'package:flutter/material.dart';
// import 'package:techmate/IntershipsScreen/application.dart';
//
// class InternshipDetails extends StatelessWidget {
//   final Map<String, dynamic> internship;
//
//   const InternshipDetails({super.key, required this.internship});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           internship['InternTitle'] ?? 'Internship Details',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.blue[800],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 25,
//                     backgroundImage: NetworkImage(internship['Link'] ?? 'images/cs.jpeg'),
//                   ),
//                   SizedBox(width: 16.0),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           internship['InternTitle'] ?? 'No title',
//                           style: TextStyle(
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 4.0),
//                         Text(
//                           internship['CompanyName'] ?? 'No company',
//                           style: TextStyle(
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                         SizedBox(height: 4.0),
//                         Text(
//                           internship['City'] ?? 'No location',
//                           style: TextStyle(
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.more_vert),
//                     onPressed: () {
//                       // Handle menu button press
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8.0),
//               Row(
//                 children: [
//                   Flexible(
//                     child: Text(
//                       internship['Date'] ?? 'Posted date not available', // Replace with actual posted time if available
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   Flexible(
//                     child: Text(
//                       internship['Paid'] ?? 'No compensation info', // Compensation info
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8.0),
//               Row(
//                 children: [
//                   Flexible(
//                     child: Text(
//                       internship['Duration'] ?? 'No duration specified', // Job duration
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8.0),
//               Text(
//                 'Requirements',
//                 style: TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 8.0),
//               Text(
//                 internship['Requirements'] ?? 'No requirements listed', // Requirements
//               ),
//               SizedBox(height: 8.0),
//               Row(
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue[800],
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ApplyToInternshipScreen(),
//                         ),
//                       );
//                     },
//                     child: Text('Easy Apply'),
//                   ),
//                   SizedBox(width: 8.0),
//                   OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                       side: BorderSide(color: Colors.blue[800]!),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onPressed: () {
//                       // Handle save button press
//                     },
//                     child: Text(
//                       'Save',
//                       style: TextStyle(color: Colors.blue[800]),
//                     ),
//                   ),
//                 ],
//               ),
//               Divider(),
//               Text(
//                 'About the job',
//                 style: TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 8.0),
//               Text(
//                 internship['Description'] ?? 'No description available', // Job description
//               ),
//               // Divider(),
//               // Text(
//               //   'Responsibilities',
//               //   style: TextStyle(
//               //     fontSize: 16.0,
//               //     fontWeight: FontWeight.bold,
//               //   ),
//               // ),
//               // SizedBox(height: 8.0),
//               // Text(
//               //   internship['Responsibilities'] ?? 'No responsibilities listed', // Responsibilities
//               //   style: TextStyle(
//               //     color: Colors.grey[600],
//               //   ),
//               // ),
//               // Divider(),
//               // Text(
//               //   'Qualifications',
//               //   style: TextStyle(
//               //     fontSize: 16.0,
//               //     fontWeight: FontWeight.bold,
//               //   ),
//               // ),
//               // SizedBox(height: 8.0),
//               // Text(
//               //   internship['Qualifications'] ?? 'No qualifications listed', // Qualifications
//               //   style: TextStyle(
//               //     color: Colors.grey[600],
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InternshipDetails extends StatelessWidget {
  final Map<String, dynamic> internship;

  const InternshipDetails({super.key, required this.internship});

  Future<void> _apply(BuildContext context) async {
    final link = internship['Link'];
    if (link != null && link.isNotEmpty) {
      final uri = Uri.parse(link);
      print('Launching URL: $link');  // Logging the URL
      try {
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
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
          internship['InternTitle'] ?? 'Internship Details',
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
                          internship['City'] ?? 'No location',
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
                      internship['Date'] ?? 'Posted date not available', // Replace with actual posted time if available
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    child: Text(
                      internship['Paid'] ?? 'No compensation info', // Compensation info
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
                      internship['Duration'] ?? 'No duration specified', // Job duration
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
                internship['Requirements'] ?? 'No requirements listed', // Requirements
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
                internship['Description'] ?? 'No description available', // Job description
              ),
            ],
          ),
        ),
      ),
    );
  }
}
