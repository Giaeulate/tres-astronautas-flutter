import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';
import 'package:tres_astronauntas_demo/apps/web/bloc/auth/views/login_view.dart';
import 'package:tres_astronauntas_demo/apps/web/bloc/home/views/home_view.dart';
import 'package:tres_astronauntas_demo/apps/web/provider/auth_provider.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const HomeView();
    }
    return const LoginView();
  });
}
