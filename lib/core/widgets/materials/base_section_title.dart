import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

class BaseSectionTitle extends StatelessWidget {
  final String title;
  const BaseSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppDimensions.paddingM,
        bottom: AppDimensions.paddingS,
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: AppDimensions.spaceS),
          Text(title, style: AppTextStyles.h4),
        ],
      ),
    );
  }
}

