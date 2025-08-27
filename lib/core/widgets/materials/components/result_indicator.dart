import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_dimensions.dart';

class ResultIndicator extends StatelessWidget {
  final bool isCorrect;
  final TextStyle textStyle;

  const ResultIndicator({
    super.key,
    required this.isCorrect,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isCorrect ? Icons.check_circle : Icons.cancel,
          color: isCorrect ? AppColors.success : AppColors.error,
          size: AppDimensions.iconS,
        ),
        const SizedBox(width: AppDimensions.spaceXS),
        Text(
          isCorrect
              ? AppConstants.correctAnswerText
              : AppConstants.wrongAnswerText,
          style: textStyle.copyWith(
            color: isCorrect ? AppColors.success : AppColors.error,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
