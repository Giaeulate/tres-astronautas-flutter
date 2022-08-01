import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tres_astronauntas_demo/apps/web/Layout/auth_layout.dart';
import 'package:tres_astronauntas_demo/apps/web/Layout/dashboard_layout.dart';
import 'package:tres_astronauntas_demo/apps/web/Layout/splash_layout.dart';
import 'package:tres_astronauntas_demo/apps/web/provider/auth_provider.dart';
import 'package:tres_astronauntas_demo/global/navigation_service.dart';
import 'provider/side_menu_provider.dart';
import 'provider/sidebar_provider.dart';
import 'router/router.dart';
import 'widgets/custom_scroll.dart';

class MyWeb extends StatelessWidget {
  const MyWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => SideMenuProvider(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => SidebarProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'Tres Atronauntas Demo Web',
        initialRoute: '/',
        onGenerateRoute: Flurorouter.router.generator,
        navigatorKey: NavigationService.navigateKey,
        builder: (_, child) {
          final authProvider = Provider.of<AuthProvider>(context);
          if (authProvider.authStatus == AuthStatus.checking) {
            return const SplashLayout();
          }
          if (authProvider.authStatus == AuthStatus.authenticated) {
            return DashboardLayout(child: child!);
          } else {
            return AuthLayout(child: child!);
          }
        },
        theme: ThemeData.light().copyWith(
          scrollbarTheme: const ScrollbarThemeData().copyWith(
            thumbColor: MaterialStateProperty.all(
              Colors.grey.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
