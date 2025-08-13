import 'dart:async';

import 'package:get/get.dart';

import '../../../../core/constants/app_timing.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/models/mufrodat_entry.dart';
import '../../../../shared/services/mufrodat_service.dart';
import '../../../../shared/services/storage_service.dart';

class SplashController extends GetxController {
  final words = <MufrodatEntry>[].obs;
  final secondsLeft = (AppTiming.splashDuration ~/ 1000).obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _loadMufrodat();
    _startCountdown();
    _navigateToNextScreen();
  }

  Future<void> _loadMufrodat() async {
    try {
      final sample = await MufrodatService.randomSample(10);
      words.assignAll(sample);
    } catch (_) {
      // ignore errors on splash
    }
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

  void _startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      final next = secondsLeft.value - 1;
      if (next <= 0) {
        secondsLeft.value = 0;
        t.cancel();
      } else {
        secondsLeft.value = next;
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
