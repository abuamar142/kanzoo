import 'package:get/get.dart';

import '../features/auth/presentation/pages/login_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/materials/presentation/pages/material_detail_page.dart';
import '../features/materials/presentation/pages/material_kind_page.dart';
import '../features/reset_data/presentation/pages/reset_data_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashPage()),
    GetPage(name: AppRoutes.login, page: () => const LoginPage()),
    GetPage(name: AppRoutes.home, page: () => const HomePage()),
    GetPage(name: AppRoutes.materialKind, page: () => const MaterialKindPage()),
    GetPage(
      name: AppRoutes.materialDetail,
      page: () => const MaterialDetailPage(),
    ),
    GetPage(name: AppRoutes.resetData, page: () => const ResetDataPage()),
  ];
}
