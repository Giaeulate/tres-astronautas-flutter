import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:tres_astronauntas_demo/apps/web/bloc/auth/views/login_view.dart';
import 'package:tres_astronauntas_demo/apps/web/bloc/home/views/home_view.dart';
import 'package:tres_astronauntas_demo/apps/web/bloc/product/views/products_view.dart';
import 'package:tres_astronauntas_demo/apps/web/provider/auth_provider.dart';

class DashboardHandlers {
  static Handler main = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    // final sidebarProvider = Provider.of<SidebarProvider>(context);
    // Future.delayed(
    //   const Duration(milliseconds: 1),
    //   () => sidebarProvider.menuSelected = 0,
    // );
    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const HomeView();
    }
    return const LoginView();
  });

  static Handler products = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const ProductsView();
    }
    return const LoginView();
  });
}
