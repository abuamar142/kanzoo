import 'package:get/get.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() async {
    // Wait for splash duration (2 seconds)
    await Future.delayed(
      const Duration(milliseconds: AppConstants.splashDuration),
    );

    // Navigate to home page
    Get.offNamed(AppRoutes.home);
  }
}
