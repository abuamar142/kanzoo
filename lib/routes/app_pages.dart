import 'package:get/get.dart';

import '../features/auth/presentation/pages/login_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/materials/presentation/pages/material_kind_detail_page.dart';
import '../features/materials/presentation/pages/materials_chapter_topics_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashPage()),
    GetPage(name: AppRoutes.login, page: () => const LoginPage()),
    GetPage(name: AppRoutes.home, page: () => const HomePage()),
    // Materials flow: home -> chapter topics -> material detail
    GetPage(
      name: '${AppRoutes.materialsChapter}/:chapter',
      page: () => const MaterialsChapterTopicsPage(),
    ),
    GetPage(
      name: '${AppRoutes.materialsKindDetail}/:chapter/:kind',
      page: () => const MaterialKindDetailPage(),
    ),
  ];
}
