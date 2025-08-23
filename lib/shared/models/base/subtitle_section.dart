import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';
import 'material_section.dart';

class SubtitleSection extends MaterialSection {
  final String subtitle;
  final bool enablePadding;

  const SubtitleSection(this.subtitle, {this.enablePadding = true});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final fontController = Get.find<FontSizeController>();

      return Padding(
        padding: EdgeInsets.only(
          bottom: enablePadding ? AppDimensions.paddingM : 0,
        ),
        child: Text(
          subtitle,
          style: AppTextStyles.bodyLarge.copyWith(
            fontSize:
                AppTextStyles.bodyLarge.fontSize! * (fontController.fontScale),
          ),
        ),
      );
    });
  }
}
