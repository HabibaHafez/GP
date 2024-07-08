// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:techmate/StudentUser/BottonNavigationBar/navbar.dart';
// import 'package:techmate/providers/BookingProvider.dart';
// import 'package:techmate/services/Mentor/bookmeeting.dart';
// import 'package:techmate/services/Mentor/getmentor.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SelectDateTimeScreen extends StatefulWidget {
//   final Mentor mentor;
//
//   const SelectDateTimeScreen({super.key, required this.mentor});
//
//   @override
//   _SelectDateTimeScreenState createState() => _SelectDateTimeScreenState();
// }
//
// class _SelectDateTimeScreenState extends State<SelectDateTimeScreen> {
//   DateTime selectedDate = DateTime.now();
//   String selectedTime = '4:00';
//
//   final BookingService _bookingService = BookingService();
//
//   @override
//   void initState() {
//     super.initState();
//     _retrieveAndSetStudentId();
//   }
//
//   Future<void> _retrieveAndSetStudentId() async {
//     int? nationalId = await getNationalId();
//     if (nationalId != null) {
//       Provider.of<BookingProvider>(context, listen: false).setStudentId(nationalId);
//     }
//   }
//
//   Future<int?> getNationalId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getInt('national_id');
//   }
//
//   void _bookMeeting() async {
//     final provider = Provider.of<BookingProvider>(context, listen: false);
//
//     String date = selectedDate.toIso8601String().split('T')[0];
//     String duration = selectedTime;
//
//     // Check if studentId is not null before proceeding
//     if (provider.studentId != null) {
//       bool booked = await _bookingService.bookMeeting(
//         mentorId: widget.mentor.id,
//         studentId: provider.studentId!, // Use studentId safely
//         date: date,
//         duration: duration,
//       );
//
//       if (booked) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Meeting booked successfully!')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Failed to book meeting.')),
//         );
//       }
//     } else {
//       // Handle the case where studentId is null
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Student ID not found.')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Book Meeting', style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         iconTheme: const IconThemeData(color: Colors.black),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: <Widget>[
//                       const Text(
//                         'Select a Date and Time',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 20),
//                       CalendarDatePicker(
//                         initialDate: selectedDate,
//                         firstDate: DateTime(2000),
//                         lastDate: DateTime(2100),
//                         onDateChanged: (date) {
//                           setState(() {
//                             selectedDate = date;
//                           });
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       GridView.count(
//                         crossAxisCount: 3,
//                         shrinkWrap: true,
//                         crossAxisSpacing: 8.0,
//                         mainAxisSpacing: 8.0,
//                         childAspectRatio: 2.5,
//                         children: <String>[
//                           '9:00',
//                           '10:00',
//                           '11:00',
//                           '2:00',
//                           '3:00',
//                           '4:00',
//                           '5:00'
//                         ]
//                             .map((time) => GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedTime = time;
//                             });
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8.0),
//                               color: selectedTime == time
//                                   ? Colors.blue[800]
//                                   : Colors.grey.shade200,
//                             ),
//                             child: Center(
//                               child: Text(
//                                 time,
//                                 style: TextStyle(
//                                   color: selectedTime == time
//                                       ? Colors.white
//                                       : Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ))
//                             .toList(),
//                       ),
//                       const SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: _bookMeeting,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue[800],
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                         ),
//                         child: const Text(
//                           'Book',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(currentIndex: 3),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techmate/StudentUser/BottonNavigationBar/navbar.dart';
import 'package:techmate/providers/BookingProvider.dart';
import 'package:techmate/services/Mentor/bookmeeting.dart';
import 'package:techmate/services/Mentor/getmentor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectDateTimeScreen extends StatefulWidget {
  final Mentor mentor;

  const SelectDateTimeScreen({super.key, required this.mentor});

  @override
  _SelectDateTimeScreenState  createState() => _SelectDateTimeScreenState();
}

class _SelectDateTimeScreenState extends State<SelectDateTimeScreen> {
  DateTime selectedDate = DateTime.now();
  String selectedTime = '4:00';

  final BookingService _bookingService = BookingService();

  @override
  void initState() {
    super.initState();
    _retrieveAndSetStudentId();
  }

  Future<void> _retrieveAndSetStudentId() async {
    int? nationalId = await getNationalId();
    if (nationalId != null) {
      Provider.of<BookingProvider>(context, listen: false)
          .setStudentId(nationalId);
    }
  }

  Future<int?> getNationalId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('national_id');
  }

  void _bookMeeting() async {
    final provider = Provider.of<BookingProvider>(context, listen: false);

    String date = selectedDate.toIso8601String().split('T')[0];
    String duration = selectedTime;

    // Check if studentId is not null before proceeding
    if (provider.studentId != null) {
      bool booked = await _bookingService.bookMeeting(
        mentorId: widget.mentor.id,
        studentId: provider.studentId!, // Use studentId safely
        date: date,
        duration: duration,
      );

      if (booked) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Meeting booked successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to book meeting.')),
        );
      }
    } else {
      // Handle the case where studentId is null
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student ID not found.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        const Text('Book Meeting', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'Select a Date and Time',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      CalendarDatePicker(
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        onDateChanged: (date) {
                          setState(() {
                            selectedDate = date;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 2.5,
                        children: <String>[
                          '9:00',
                          '10:00',
                          '11:00',
                          '2:00',
                          '3:00',
                          '4:00',
                          '5:00'
                        ]
                            .map((time) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTime = time;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: selectedTime == time
                                  ? Colors.blue[800]
                                  : Colors.grey.shade200,
                            ),
                            child: Center(
                              child: Text(
                                time,
                                style: TextStyle(
                                  color: selectedTime == time
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ))
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _bookMeeting,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Book',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 3),
    );
  }
}
