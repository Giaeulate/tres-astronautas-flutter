import 'package:flutter/material.dart';

class NavbarNotification extends StatefulWidget {
  const NavbarNotification({Key? key}) : super(key: key);

  @override
  _NavbarNotificationState createState() => _NavbarNotificationState();
}

class _NavbarNotificationState extends State<NavbarNotification> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Center(
        child: Icon(
          // Icons.notifications_outlined,
          // Icons.notification_important_outlined,
          Icons.notifications_active_outlined,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
