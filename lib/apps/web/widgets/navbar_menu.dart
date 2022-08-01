import 'package:flutter/material.dart';
import 'package:tres_astronauntas_demo/apps/web/provider/side_menu_provider.dart';

class NavbarMenu extends StatefulWidget {
  const NavbarMenu({Key? key}) : super(key: key);

  @override
  _NavbarMenuState createState() => _NavbarMenuState();
}

class _NavbarMenuState extends State<NavbarMenu> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SideMenuProvider.isOpen
          ? SideMenuProvider.closeMenu()
          : SideMenuProvider.openMenu(),
      child: const Center(
        child: Icon(
          Icons.menu_outlined,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
