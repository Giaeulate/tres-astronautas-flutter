import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tres_astronauntas_demo/apps/web/main_web.dart';
import 'package:tres_astronauntas_demo/apps/web/provider/auth_provider.dart';
import 'package:tres_astronauntas_demo/apps/web/router/router.dart';
import 'package:tres_astronauntas_demo/global/local_storage.dart';

void main() async {
  await LocalStorage.configurePreferences();
  Flurorouter.configureRoutes();
  if (kIsWeb) {
    runApp(const AppState(MyWeb()));
  } else {
    // runApp(const AppState(MyDesktop()));
  }
}

class AppState extends StatelessWidget {
  final Widget child;
  const AppState(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => AuthProvider(),
        ),
      ],
      child: child,
    );
  }
}
