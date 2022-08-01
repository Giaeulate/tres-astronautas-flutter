import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tres_astronauntas_demo/global/navigation_service.dart';
import 'package:tres_astronauntas_demo/widgets/custom_text.dart';
import '../provider/side_menu_provider.dart';
import '../provider/sidebar_provider.dart';
import '../router/router.dart';
import 'button_sidebar.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sidebarProvider = Provider.of<SidebarProvider>(context);
    // print('sidebar');
    return Container(
      width: 300,
      color: Colors.black,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              child: const CustomText(
                "Tres Astronauntas",
                fontSize: 30,
                color: Colors.white,
              ),
              onTap: () {
                if (SideMenuProvider().currentPage !=
                    Flurorouter.dashboardRoute) {
                  NavigationService.replaceTo(Flurorouter.dashboardRoute);
                }
                SideMenuProvider.closeMenu();
              },
            ),
          ),
          ButtonSidebar(
            isSelected: sidebarProvider.menuSelected == 1,
            text: 'Productos',
            onlyTextImage: true,
            onPressed: () {
              if (SideMenuProvider().currentPage != Flurorouter.productsRoute) {
                NavigationService.replaceTo(Flurorouter.productsRoute);
              }
              SideMenuProvider.closeMenu();
            },
          ),
        ],
      ),
    );
  }
}
