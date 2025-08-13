import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';

class LoginButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;

  const LoginButton({super.key, required this.isLoading, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: AppColors.alpha30),
            blurRadius: AppDimensions.shadowBlurRadius,
            offset: const Offset(0, AppDimensions.paddingXS),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.secondary,
          disabledBackgroundColor: AppColors.borderLight,
          minimumSize: const Size(
            double.infinity,
            AppDimensions.buttonHeightLarge,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: AppDimensions.iconS,
                    width: AppDimensions.iconS,
                    child: CircularProgressIndicator(
                      strokeWidth: AppDimensions.strokeWidthThin,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spaceS),
                  Text(
                    'Memproses...',
                    style: AppTextStyles.buttonLarge.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppDimensions.paddingXS),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(
                        alpha: AppColors.alpha20,
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusS,
                      ),
                    ),
                    child: const Icon(
                      Icons.login,
                      size: AppDimensions.iconS,
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spaceM),
                  Text(
                    AppConstants.loginButtonText,
                    style: AppTextStyles.buttonLarge,
                  ),
                ],
              ),
      ),
    );
  }
}
