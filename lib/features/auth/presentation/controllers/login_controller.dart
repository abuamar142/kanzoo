import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/services/storage_service.dart';

class LoginController extends GetxController {
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Observable variables
  final selectedClass = Rx<String?>(null);
  final isLoading = false.obs;

  // List kelas yang tersedia
  final List<String> availableClasses = AppConstants.availableClasses;

  @override
  void onInit() {
    super.onInit();
    _checkIfAlreadyLoggedIn();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

  void _checkIfAlreadyLoggedIn() async {
    final isLoggedIn = await StorageService.isUserLoggedIn();
    if (isLoggedIn) {
      // Jika sudah login, langsung ke home
      Get.offAllNamed(AppRoutes.home);
    }
  }

  void selectClass(String className) {
    selectedClass.value = className;
    Get.back(); // Close bottom sheet
  }

  void showClassPicker() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(AppDimensions.paddingL),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.radiusL),
            topRight: Radius.circular(AppDimensions.radiusL),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: AppDimensions.spaceXXL,
                height: AppDimensions.spaceXS,
                decoration: BoxDecoration(
                  color: AppColors.borderLight,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusXS),
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.spaceL),

            // Title
            const Text(AppConstants.classPickerTitle, style: AppTextStyles.h4),
            const SizedBox(height: AppDimensions.spaceM),

            // Class options
            ...availableClasses.map(
              (className) => ListTile(
                title: Text(
                  '${AppConstants.classPrefix} $className',
                  style: AppTextStyles.bodyLarge,
                ),
                leading: const Icon(Icons.class_),
                onTap: () => selectClass(className),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusS),
                ),
              ),
            ),

            const SizedBox(height: AppDimensions.spaceL),
          ],
        ),
      ),
      isDismissible: true,
      enableDrag: true,
    );
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppConstants.nameEmptyError;
    }
    if (value.trim().length < AppConstants.nameMinLength) {
      return AppConstants.nameMinLengthError;
    }
    return null;
  }

  String? validateClass() {
    if (selectedClass.value == null) {
      return AppConstants.classEmptyError;
    }
    return null;
  }

  void login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (validateClass() != null) {
      Get.snackbar(
        AppConstants.errorTitle,
        AppConstants.classEmptyError,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: AppColors.secondary,
        margin: const EdgeInsets.all(AppDimensions.marginM),
      );
      return;
    }

    isLoading.value = true;

    try {
      final success = await StorageService.saveUserData(
        name: nameController.text.trim(),
        className: selectedClass.value!,
      );

      if (success) {
        Get.snackbar(
          AppConstants.successTitle,
          '${AppConstants.loginSuccessMessage}, ${nameController.text.trim()}!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.success,
          colorText: AppColors.secondary,
          margin: const EdgeInsets.all(AppDimensions.marginM),
        );

        // Navigate to home
        Get.offAllNamed(AppRoutes.home);
      } else {
        throw Exception(AppConstants.saveDataError);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        '${AppConstants.generalError}: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: AppColors.secondary,
        margin: const EdgeInsets.all(AppDimensions.marginM),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
