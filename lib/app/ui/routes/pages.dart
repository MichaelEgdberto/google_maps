import 'package:flutter/widgets.dart';
import 'package:google_maps/app/ui/pages/home/request_permissions/request_permission_page.dart';
import 'package:google_maps/app/ui/pages/splash/splash_page.dart';
import 'package:google_maps/app/ui/routes/routes.dart';

import '../pages/home/home_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.PERMISSIONS: (_) => const RequestPermissionPage(),
    Routes.HOME: (_) => const HomePage(),
  };
}
