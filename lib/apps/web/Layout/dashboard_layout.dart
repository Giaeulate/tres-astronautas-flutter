import 'package:flutter/material.dart';
import 'package:tres_astronauntas_demo/apps/web/provider/side_menu_provider.dart';
import 'package:tres_astronauntas_demo/apps/web/widgets/navbar.dart';
import 'package:tres_astronauntas_demo/global/environment.dart';
import '../widgets/sidebar.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;
  const DashboardLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  DashboardLayoutState createState() => DashboardLayoutState();
}

class DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SideMenuProvider.menuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    return Scaffold(
      body: Column(
        children: [
          const Navbar(),
          Expanded(
            child: Stack(
              children: [
                Row(
                  children: [
                    w > Environment.tabletSize
                        ? const Sidebar()
                        : const SizedBox(),
                    Expanded(child: widget.child),
                  ],
                ),
                if (w <= Environment.tabletSize)
                  AnimatedBuilder(
                    animation: SideMenuProvider.menuController,
                    builder: (_, __) => Stack(
                      children: [
                        if (SideMenuProvider.isOpen)
                          Opacity(
                            opacity: SideMenuProvider.opacity.value,
                            child: GestureDetector(
                              onTap: () => SideMenuProvider.closeMenu(),
                              child: Container(
                                width: w,
                                height: h,
                                color: Colors.black12,
                              ),
                            ),
                          ),
                        Transform.translate(
                          offset: Offset(SideMenuProvider.movement.value, 0),
                          child: const Sidebar(),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
