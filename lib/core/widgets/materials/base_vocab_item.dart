import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

class BaseVocabItem extends StatelessWidget {
  final String arabic;
  final String indonesian;
  final String? note;
  final double fontScale;

  const BaseVocabItem({
    super.key,
    required this.arabic,
    required this.indonesian,
    this.note,
    this.fontScale = 1.0,
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
          bottom: BorderSide(
            color: AppColors.borderLight.withValues(alpha: AppColors.alpha60),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  indonesian,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontSize:
                        (AppTextStyles.bodyLarge.fontSize ?? 16) * fontScale,
                  ),
                ),
                if (note != null)
                  Text(
                    note!,
                    style: AppTextStyles.caption.copyWith(
                      fontSize:
                          (AppTextStyles.caption.fontSize ?? 12) * fontScale,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppDimensions.spaceM),
          Text(
            arabic,
            style: AppTextStyles.arabicText.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: (AppTextStyles.arabicText.fontSize ?? 18) * fontScale,
            ),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
