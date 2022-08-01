import 'package:flutter/material.dart';

class NavbarAvatar extends StatefulWidget {
  const NavbarAvatar({Key? key}) : super(key: key);

  @override
  _NavbarAvatarState createState() => _NavbarAvatarState();
}

class _NavbarAvatarState extends State<NavbarAvatar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Center(
        child: Icon(
          Icons.account_circle_rounded,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
