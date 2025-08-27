import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/string_extensions.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';
import 'material_section.dart';

class MatchingPair {
  final String left;
  final String right;

  const MatchingPair({required this.left, required this.right});
}

class MatchingQuestionSectionController extends GetxController {
  final List<MatchingPair> pairs;
  final String sectionId;

  late List<String?> selectedAnswers;
  RxBool showResults = false.obs;

  MatchingQuestionSectionController(this.pairs, this.sectionId) {
    selectedAnswers = List.filled(pairs.length, null);
  }

  void selectAnswer(int pairIndex, String selectedOption) {
    if (!showResults.value) {
      selectedAnswers[pairIndex] = selectedOption;
      update();
    }
  }

  void checkAllAnswers() {
    showResults.value = true;
    update();
  }

  void resetAnswers() {
    selectedAnswers = List.filled(pairs.length, null);
    showResults.value = false;
    update();
  }

  bool canCheckAnswers() {
    return selectedAnswers.every((answer) => answer != null);
  }

  int getCorrectAnswersCount() {
    int correct = 0;
    for (int i = 0; i < pairs.length; i++) {
      if (selectedAnswers[i] == pairs[i].right) {
        correct++;
      }
    }
    return correct;
  }

  double getPercentage() {
    if (pairs.isEmpty) return 0.0;
    return (getCorrectAnswersCount() / pairs.length) * 100;
  }

  bool isCorrectAnswer(int pairIndex, String option) {
    return pairs[pairIndex].right == option;
  }

  bool isSelectedAnswer(int pairIndex, String option) {
    return selectedAnswers[pairIndex] == option;
  }
}

class MatchingQuestionSection extends MaterialSection {
  final String title;
  final String? subtitle;
  final String leftColumnTitle;
  final String rightColumnTitle;
  final List<MatchingPair> pairs;
  final String sectionId;

  const MatchingQuestionSection({
    required this.title,
    this.subtitle,
    required this.leftColumnTitle,
    required this.rightColumnTitle,
    required this.pairs,
    required this.sectionId,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchingQuestionSectionController>(
      init: MatchingQuestionSectionController(pairs, sectionId),
      builder: (controller) {
        return Obx(() {
          final fontController = Get.find<FontSizeController>();

          // Get all right options and shuffle them for display
          final rightOptions = pairs.map((pair) => pair.right).toList()
            ..shuffle();

          return Container(
            margin: EdgeInsets.only(bottom: AppDimensions.marginL),
            padding: EdgeInsets.all(AppDimensions.paddingM),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Text(
                  title,
                  style: AppTextStyles.h3.copyWith(
                    fontSize:
                        AppTextStyles.h3.fontSize! * fontController.fontScale,
                    color: AppColors.primary,
                  ),
                ),
                if (subtitle != null) ...[
                  SizedBox(height: AppDimensions.spaceS),
                  Text(
                    subtitle!,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontSize:
                          AppTextStyles.bodyMedium.fontSize! *
                          fontController.fontScale,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
                SizedBox(height: AppDimensions.spaceL),

                // Column headers
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        leftColumnTitle,
                        style: AppTextStyles.h4.copyWith(
                          fontSize:
                              AppTextStyles.h4.fontSize! *
                              fontController.fontScale,
                          color: AppColors.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: AppDimensions.spaceM),
                    Expanded(
                      child: Text(
                        rightColumnTitle,
                        style: AppTextStyles.h4.copyWith(
                          fontSize:
                              AppTextStyles.h4.fontSize! *
                              fontController.fontScale,
                          color: AppColors.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.spaceM),

                // Matching pairs
                ...pairs.asMap().entries.map((entry) {
                  final pairIndex = entry.key;
                  final pair = entry.value;
                  final selectedAnswer = controller.selectedAnswers[pairIndex];

                  return Container(
                    margin: EdgeInsets.only(bottom: AppDimensions.marginM),
                    child: Row(
                      children: [
                        // Left item
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(AppDimensions.paddingM),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusS,
                              ),
                              border: Border.all(
                                color: AppColors.primary.withValues(alpha: 0.3),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              '${pairIndex + 1}. ${pair.left}',
                              style: AppTextStyles.bodyMedium.copyWith(
                                fontSize:
                                    AppTextStyles.bodyMedium.fontSize! *
                                    fontController.fontScale,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: pair.left.isPrimarilyArabic
                                  ? TextAlign.right
                                  : TextAlign.left,
                              textDirection: pair.left.isPrimarilyArabic
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                            ),
                          ),
                        ),
                        SizedBox(width: AppDimensions.spaceM),

                        // Right options dropdown
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: selectedAnswer,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.radiusS,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: AppDimensions.paddingM,
                                vertical: AppDimensions.paddingS,
                              ),
                            ),
                            hint: Text(
                              'Pilih jawaban',
                              style: AppTextStyles.bodyMedium.copyWith(
                                fontSize:
                                    AppTextStyles.bodyMedium.fontSize! *
                                    fontController.fontScale,
                                color: AppColors.textHint,
                              ),
                            ),
                            isExpanded: true,
                            items: rightOptions.map((option) {
                              final optionKey = String.fromCharCode(
                                97 + rightOptions.indexOf(option),
                              ); // a, b, c, d, e

                              Color textColor = AppColors.textPrimary;
                              if (controller.showResults.value) {
                                final isCorrect = controller.isCorrectAnswer(
                                  pairIndex,
                                  option,
                                );
                                final isSelected = controller.isSelectedAnswer(
                                  pairIndex,
                                  option,
                                );

                                if (isSelected && !isCorrect) {
                                  textColor = AppColors.error;
                                } else if (isCorrect) {
                                  textColor = AppColors.success;
                                }
                              }

                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(
                                  '$optionKey. $option',
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    fontSize:
                                        AppTextStyles.bodyMedium.fontSize! *
                                        fontController.fontScale,
                                    color: textColor,
                                  ),
                                  textAlign: option.isPrimarilyArabic
                                      ? TextAlign.right
                                      : TextAlign.left,
                                  textDirection: option.isPrimarilyArabic
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                ),
                              );
                            }).toList(),
                            onChanged: controller.showResults.value
                                ? null
                                : (value) {
                                    if (value != null) {
                                      controller.selectAnswer(pairIndex, value);
                                    }
                                  },
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                SizedBox(height: AppDimensions.spaceL),

                // Action Buttons
                if (!controller.showResults.value) ...[
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.canCheckAnswers()
                          ? () => controller.checkAllAnswers()
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.surface,
                        padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.paddingM,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusS,
                          ),
                        ),
                      ),
                      child: Text(
                        AppConstants.checkAnswerButtonText,
                        style: AppTextStyles.buttonMedium.copyWith(
                          fontSize:
                              AppTextStyles.buttonMedium.fontSize! *
                              fontController.fontScale,
                        ),
                      ),
                    ),
                  ),
                  if (!controller.canCheckAnswers()) ...[
                    SizedBox(height: AppDimensions.spaceS),
                    Text(
                      'Jawab semua soal terlebih dahulu',
                      style: AppTextStyles.caption.copyWith(
                        fontSize:
                            AppTextStyles.caption.fontSize! *
                            fontController.fontScale,
                        color: AppColors.textHint,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ] else ...[
                  // Results
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppDimensions.paddingM),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusS,
                      ),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Hasil: ${controller.getCorrectAnswersCount()}/${controller.pairs.length}',
                          style: AppTextStyles.h4.copyWith(
                            fontSize:
                                AppTextStyles.h4.fontSize! *
                                fontController.fontScale,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: AppDimensions.spaceS),
                        Text(
                          'Persentase: ${controller.getPercentage().toStringAsFixed(1)}%',
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize:
                                AppTextStyles.bodyMedium.fontSize! *
                                fontController.fontScale,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppDimensions.spaceM),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.resetAnswers(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.warning,
                        foregroundColor: AppColors.surface,
                        padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.paddingM,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusS,
                          ),
                        ),
                      ),
                      child: Text(
                        AppConstants.resetButtonText,
                        style: AppTextStyles.buttonMedium.copyWith(
                          fontSize:
                              AppTextStyles.buttonMedium.fontSize! *
                              fontController.fontScale,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        });
      },
    );
  }
}
