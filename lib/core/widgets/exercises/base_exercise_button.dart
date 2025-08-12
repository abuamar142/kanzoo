import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

class BaseExerciseButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const BaseExerciseButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.primary),
        foregroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingM,
          vertical: AppDimensions.paddingS,
        ),
        textStyle: AppTextStyles.buttonMedium,
      ),
      child: Text(label),
    );
  }
}

