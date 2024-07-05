import 'package:flutter/material.dart';
import 'package:techmate/services/Mentor/bookmeeting.dart';

class BookingsScreen extends StatefulWidget {
  final int studentId;

  const BookingsScreen({Key? key, required this.studentId}) : super(key: key);

  @override
  _BookingsScreenState createState() => _BookingsScreenState();
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
        title: Text('Your Bookings'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : bookings.isEmpty
          ? Center(child: Text('No bookings found.'))
          : ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          Booking booking = bookings[index];
          return ListTile(
            title: Text(
                'Mentor Name: ${booking.mentorName ?? 'Unknown'}'),
            subtitle: Text(
              'Date: ${booking.date}, Time: ${booking.duration}',
            ),
            // Add more details as needed
          );
        },
      ),
    );
  }
}
