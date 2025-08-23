import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';
import 'material_section.dart';

class TitleSection extends MaterialSection {
  final String title;
  final bool enablePadding;

  const TitleSection(this.title, {this.enablePadding = true});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final fontController = Get.find<FontSizeController>();

      return Padding(
        padding: EdgeInsets.only(
          bottom: enablePadding ? AppDimensions.paddingM : 0,
        ),
        child: Text(
          title,
          style: AppTextStyles.h2.copyWith(
            fontSize: AppTextStyles.h2.fontSize! * (fontController.fontScale),
          ),
        ),
      );
    });
  }
}
