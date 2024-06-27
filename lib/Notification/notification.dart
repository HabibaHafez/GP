import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),


      ),
      body: ListView(
        children: <Widget>[
          NotificationSection(
            title: 'Stay Updated',
            notifications: [
              NotificationItem(
                avatar: Icons.account_circle,
                title: 'TechE',
                subtitle: 'Accepted Your Connection',
                time: '2m ago',
              ),
              // Add more notifications here
            ],
          ),
          NotificationSection(
            title: 'This Week',
            notifications: [
              NotificationItem(
                avatar: Icons.event,
                title: 'Event Reminder',
                subtitle: 'Your event "Flutter Meetup" is coming up',
                time: '3d ago',
              ),
              NotificationItem(
                avatar: Icons.message,
                title: 'Message from Jane',
                subtitle: 'Hey, are you coming to the party?',
                time: '5d ago',
              ),
              // Add more notifications here
            ],
          ),
          NotificationSection(
            title: 'Earlier Today',
            notifications: [
              NotificationItem(
                avatar: Icons.shopping_cart,
                title: 'Order Shipped',
                subtitle: 'Your order #123456 has been shipped',
                time: '2h ago',
              ),
              NotificationItem(
                avatar: Icons.local_offer,
                title: 'New Offer Available',
                subtitle: 'Check out the latest deals on our app',
                time: '4h ago',
              ),
              NotificationItem(
                avatar: Icons.group_add,
                title: 'New Follower',
                subtitle: 'John Doe started following you',
                time: '6h ago',
              ),
              // Add more notifications here
            ],
          ),
        ],
      ),
    );
  }
}

class NotificationSection extends StatelessWidget {
  final String title;
  final List<NotificationItem> notifications;

  const NotificationSection({
    Key? key,
    required this.title,
    required this.notifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
          ),
        ),
        Column(
          children: notifications
              .map((notification) =>
                  NotificationTile(notification: notification))
              .toList(),
        ),
      ],
    );
  }
}

class NotificationTile extends StatelessWidget {
  final NotificationItem notification;

  const NotificationTile({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(
            notification.avatar,
            color: Colors.white,
          ),
        ),
        title: Text(notification.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.subtitle),
            SizedBox(height: 4.0),
            Text(
              notification.time,
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
          ],
        ),
        isThreeLine: true,
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}

class NotificationItem {
  final IconData avatar;
  final String title;
  final String subtitle;
  final String time;

  NotificationItem({
    required this.avatar,
    required this.title,
    required this.subtitle,
    required this.time,
  });
}
