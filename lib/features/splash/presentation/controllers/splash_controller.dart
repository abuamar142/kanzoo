import 'package:get/get.dart';

import '../../../../core/constants/app_timing.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/services/storage_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    // Wait for splash duration (2 seconds)
    await Future.delayed(
      const Duration(milliseconds: AppTiming.splashDuration),
    );

    // Check if user is already logged in
    final isLoggedIn = await StorageService.isUserLoggedIn();

    if (isLoggedIn) {
      // Navigate to home page if already logged in
      Get.offNamed(AppRoutes.home);
    } else {
      // Navigate to login page if not logged in
      Get.offNamed(AppRoutes.login);
    }
  }
}
