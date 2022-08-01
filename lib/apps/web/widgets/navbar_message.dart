import 'package:flutter/material.dart';

class NavbarMessage extends StatefulWidget {
  const NavbarMessage({Key? key}) : super(key: key);

  @override
  _NavbarMessageState createState() => _NavbarMessageState();
}

class _NavbarMessageState extends State<NavbarMessage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Center(
        child: Icon(
          Icons.messenger_outline_sharp,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
