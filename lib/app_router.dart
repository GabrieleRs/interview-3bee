import 'package:auto_route/auto_route.dart';
import 'pages/hives_page.dart';
import 'pages/login_page.dart';
import 'pages/apiaries_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true),
    AutoRoute(page: HivesPage),
    AutoRoute(page: ApiariesPage)
  ],
)
class $AppRouter {}
