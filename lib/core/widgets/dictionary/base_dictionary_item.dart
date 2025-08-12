import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

class BaseDictionaryItem extends StatelessWidget {
  final String arabic;
  final String indonesian;

  const BaseDictionaryItem({
    super.key,
    required this.arabic,
    required this.indonesian,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.paddingS,
        horizontal: AppDimensions.paddingM,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderLight.withOpacity(0.6)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              indonesian,
              style: AppTextStyles.bodyLarge,
            ),
          ),
          const SizedBox(width: AppDimensions.spaceM),
          Text(
            arabic,
            style: AppTextStyles.arabicText.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}

