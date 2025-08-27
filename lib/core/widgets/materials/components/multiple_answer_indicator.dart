import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimensions.dart';

class MultipleAnswerIndicator extends StatelessWidget {
  final TextStyle textStyle;

  const MultipleAnswerIndicator({super.key, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingXS,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.warning.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        border: Border.all(
          color: AppColors.warning.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Text(
        'Multi',
        style: textStyle.copyWith(
          color: AppColors.warning,
          fontSize: textStyle.fontSize! * 0.8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
