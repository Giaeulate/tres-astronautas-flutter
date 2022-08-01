import 'package:fluro/fluro.dart';
import 'dashboard_handlers.dart';
import 'no_page_found_handlers.dart';
import 'admin_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  // Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard
  static String dashboardRoute = '/dashboard';
  // Products
  static String productsRoute = '/products';

  static void configureRoutes() {
    // Auth Routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);

    // Products Routes
    router.define(productsRoute,
        handler: DashboardHandlers.products,
        transitionType: TransitionType.none);

    // Dashboard Routes
    router.define(dashboardRoute,
        handler: DashboardHandlers.main, transitionType: TransitionType.none);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
