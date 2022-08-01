import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tres_astronauntas_demo/apps/web/provider/auth_provider.dart';
import 'package:tres_astronauntas_demo/global/local_storage.dart';
import 'package:tres_astronauntas_demo/global/navigation_service.dart';
import 'package:tres_astronauntas_demo/widgets/custom_text.dart';
import '../router/router.dart';
import 'navbar_avatar.dart';
import 'navbar_menu.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final authProvider = Provider.of<AuthProvider>(context);
    print('navbar');
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 70,
      decoration: const BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            w > 900 ? _desktopView(authProvider) : _mobileView(authProvider),
      ),
    );
  }

  List<Widget> _mobileView(AuthProvider authProvider) {
    return [
      const NavbarMenu(),
      const NavbarAvatar(),
    ];
  }

  List<Widget> _desktopView(AuthProvider authProvider) {
    return [
      InkWell(
        onTap: () {
          NavigationService.replaceTo(Flurorouter.dashboardRoute);
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Icon(
            Icons.home,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      // Row(
      //   children: const [
      //     NavbarNotification(),
      //     SizedBox(width: 20),
      //     NavbarAvatar(),
      //     SizedBox(width: 20),
      //     NavbarMessage(),
      //   ],
      // ),
      const SizedBox(),
      TextButton(
        child: const CustomText(
          'Cerrar sesión',
          color: Colors.white,
        ),
        onPressed: () async {
          await LocalStorage.sharedPreferences.clear();
          authProvider.isAuthenticated();
          NavigationService.replaceTo(Flurorouter.loginRoute);
        },
      ),
    ];
  }
}
