import 'package:get/get.dart';

import '../features/auth/presentation/pages/login_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/materials/presentation/pages/material_detail_page.dart';
import '../features/materials/presentation/pages/materials_page.dart';
import '../features/materials/presentation/pages/materials_chapters_page.dart';
import '../features/materials/presentation/pages/materials_chapter_topics_page.dart';
import '../features/materials/presentation/pages/material_kind_detail_page.dart';
import '../features/exercises/presentation/pages/exercises_page.dart';
import '../features/exercises/presentation/pages/exercise_detail_placeholder_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashPage()),
    GetPage(name: AppRoutes.login, page: () => const LoginPage()),
    GetPage(name: AppRoutes.home, page: () => const HomePage()),
    // Materials new flow: chapters -> kinds -> detail
    GetPage(
      name: AppRoutes.materials,
      page: () => const MaterialsChaptersPage(),
    ),
    // Detail route supports both named parameter and argument id
    GetPage(
      name: '${AppRoutes.materialDetail}/:id',
      page: () => const MaterialDetailPage(),
    ),
    GetPage(
      name: '${AppRoutes.materialsChapter}/:chapter',
      page: () => const MaterialsChapterTopicsPage(),
    ),
    GetPage(
      name: '${AppRoutes.materialsKindDetail}/:chapter/:kind',
      page: () => const MaterialKindDetailPage(),
    ),
    // GetPage(
    //   name: AppRoutes.exercises,
    //   page: () => const ExercisesPage(),
    // ),
    GetPage(
      name: AppRoutes.exercises,
      page: () => const ExercisesPage(),
    ),
    GetPage(
      name: '${AppRoutes.exerciseDetail}/:id',
      page: () => const ExerciseDetailPlaceholderPage(),
    ),
  ];
}
