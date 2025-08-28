import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';
import 'material_section.dart';

class ImageSection extends MaterialSection {
  final String imagePath;
  final String? caption;
  final double? width;
  final double? height;
  final BoxFit fit;

  const ImageSection({
    required this.imagePath,
    this.caption,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    final fontController = Get.find<FontSizeController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: AppDimensions.paddingS),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: AppColors.alpha10),
                blurRadius: AppDimensions.spaceS,
                offset: Offset(0, AppDimensions.spaceXS * 0.5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            child: Image.asset(
              imagePath,
              width: width,
              height: height,
              fit: fit,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: width ?? double.infinity,
                  height: height ?? 200,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                    border: Border.all(
                      color: AppColors.primary.withValues(
                        alpha: AppColors.alpha20,
                      ),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_not_supported,
                        size: AppDimensions.iconL,
                        color: AppColors.textHint,
                      ),
                      SizedBox(height: AppDimensions.spaceXS),
                      Text('Image not found', style: AppTextStyles.caption),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        if (caption != null && caption!.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: AppDimensions.paddingXS),
            child: Obx(
              () => Text(
                caption!,
                style: AppTextStyles.caption.copyWith(
                  fontSize:
                      AppTextStyles.caption.fontSize! *
                      fontController.fontScale,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
