import 'package:auto_route/auto_route.dart';
import 'package:interview_3bee/pages/hives_page.dart';
import 'pages/login_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true),
    AutoRoute(page: HivesPage)
  ],
)
class $AppRouter {}
