// import 'package:flutter/material.dart';
// import 'package:techmate/services/Mentor/bookmeeting.dart';
//
// class BookingsScreen extends StatefulWidget {
//   final int studentId;
//
//   const BookingsScreen({Key? key, required this.studentId}) : super(key: key);
//
//   @override
//   _BookingsScreenState createState() => _BookingsScreenState();
// }
//
// class _BookingsScreenState extends State<BookingsScreen> {
//   List<Booking> bookings = [];
//   bool isLoading = true;
//   BookingService _bookingService = BookingService();
//
//   @override
//   void initState() {
//     super.initState();
//     fetchBookings();
//   }
//
//   Future<void> fetchBookings() async {
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       List<Booking> fetchedBookings =
//       await _bookingService.getStudentBookings(widget.studentId);
//
//       setState(() {
//         bookings = fetchedBookings;
//         isLoading = false;
//       });
//     } catch (e) {
//       // Handle error scenarios
//       print('Error fetching bookings: $e');
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Bookings'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : bookings.isEmpty
//           ? Center(child: Text('No bookings found.'))
//           : ListView.builder(
//         itemCount: bookings.length,
//         itemBuilder: (context, index) {
//           Booking booking = bookings[index];
//           return ListTile(
//             title: Text(
//                 'Mentor Name: ${booking.mentorName ?? 'Unknown'}'),
//             subtitle: Text(
//               'Date: ${booking.date}, Time: ${booking.duration}',
//             ),
//             // Add more details as needed
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:techmate/services/Mentor/bookmeeting.dart';

class BookingsScreen extends StatefulWidget {
  final int studentId;

  const BookingsScreen({Key? key, required this.studentId}) : super(key: key);

  @override
  _BookingsScreenState  createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  List<Booking> bookings = [];
  bool isLoading = true;
  BookingService _bookingService = BookingService();

  @override
  void initState() {
    super.initState();
    fetchBookings();
  }

  Future<void> fetchBookings() async {
    setState(() {
      isLoading = true;
    });

    try {
      List<Booking> fetchedBookings =
      await _bookingService.getStudentBookings(widget.studentId);

      setState(() {
        bookings = fetchedBookings;
        isLoading = false;
      });
    } catch (e) {
      // Handle error scenarios
      print('Error fetching bookings: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        const Text('Your Bookings', style: TextStyle(color: Colors.white)),
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : bookings.isEmpty
          ? Center(child: Text('No bookings found.'))
          : ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          Booking booking = bookings[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.blue[800]!, width: 1),
            ),
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mentor Name: ${booking.mentorName ?? 'Unknown'}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Date: ${booking.date}',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Time: ${booking.duration}',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add more details as needed
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
