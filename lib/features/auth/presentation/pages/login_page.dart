import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../controllers/login_controller.dart';
import '../widgets/class_picker.dart';
import '../widgets/login_button.dart';
import '../widgets/login_header.dart';
import '../widgets/name_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.paddingL),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppDimensions.spaceL),

                // Header with logo and welcome text
                const LoginHeader(),

                const SizedBox(height: AppDimensions.spaceXXL),

                // Form container with modern design
                Container(
                  padding: const EdgeInsets.all(AppDimensions.paddingL),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusL),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor.withValues(
                          alpha: AppColors.alpha05,
                        ),
                        blurRadius: AppDimensions.shadowBlurRadius,
                        offset: const Offset(0, AppDimensions.paddingS),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Name input field
                      NameFormField(
                        controller: controller.nameController,
                        validator: controller.validateName,
                      ),

                      const SizedBox(height: AppDimensions.spaceL),

                      // Class picker
                      Obx(
                        () => ClassPicker(
                          selectedClass: controller.selectedClass.value,
                          onTap: controller.showClassPicker,
                        ),
                      ),

                      const SizedBox(height: AppDimensions.spaceXL),

                      // Login button
                      Obx(
                        () => LoginButton(
                          isLoading: controller.isLoading.value,
                          onPressed: controller.login,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppDimensions.spaceXL),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
