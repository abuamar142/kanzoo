import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/services/shared_preferences_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/string_extensions.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';
import 'material_section.dart';

class MultipleChoiceQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String? explanation;

  const MultipleChoiceQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    this.explanation,
  });
}

class MultipleChoiceSectionController extends GetxController {
  final List<MultipleChoiceQuestion> questions;
  final String sectionId;

  late List<int?> selectedAnswers;
  RxBool showResults = false.obs;

  MultipleChoiceSectionController(this.questions, this.sectionId) {
    selectedAnswers = List.filled(questions.length, null);
    _loadSavedAnswers();
  }

  void _loadSavedAnswers() {
    final savedAnswers = SharedPreferencesService.getMultipleChoiceResults(
      sectionId,
    );
    if (savedAnswers.isNotEmpty && savedAnswers.length == questions.length) {
      selectedAnswers = savedAnswers;
      // Check if all answers were saved (meaning answers were checked before)
      if (selectedAnswers.every((answer) => answer != null)) {
        showResults.value = true;
      }
      update();
    }
  }

  void selectAnswer(int questionIndex, int optionIndex) {
    if (!showResults.value) {
      selectedAnswers[questionIndex] = optionIndex;
      update();
    }
  }

  void checkAllAnswers() async {
    showResults.value = true;
    // Save progress to SharedPreferences
    await SharedPreferencesService.saveMultipleChoiceResults(
      sectionId,
      selectedAnswers,
    );
    update();
  }

  void resetAnswers() async {
    selectedAnswers = List.filled(questions.length, null);
    showResults.value = false;
    // Clear saved progress
    await SharedPreferencesService.clearSectionAnswers(sectionId);
    update();
  }

  bool canCheckAnswers() {
    return selectedAnswers.every((answer) => answer != null);
  }

  int getCorrectAnswersCount() {
    int correct = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswerIndex) {
        correct++;
      }
    }
    return correct;
  }

  double getPercentage() {
    if (questions.isEmpty) return 0.0;
    return (getCorrectAnswersCount() / questions.length) * 100;
  }
}

class MultipleChoiceSection extends MaterialSection {
  final String title;
  final String? subtitle;
  final List<MultipleChoiceQuestion> questions;
  final String sectionId;

  const MultipleChoiceSection({
    required this.title,
    this.subtitle,
    required this.questions,
    required this.sectionId,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MultipleChoiceSectionController>(
      init: MultipleChoiceSectionController(questions, sectionId),
      builder: (controller) {
        return Obx(() {
          final fontController = Get.find<FontSizeController>();

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
                // Questions
                ...questions.asMap().entries.map((entry) {
                  final questionIndex = entry.key;
                  final question = entry.value;
                  final selectedAnswer =
                      controller.selectedAnswers[questionIndex];
                  final isCorrect =
                      selectedAnswer == question.correctAnswerIndex;

                  return Container(
                    margin: EdgeInsets.only(bottom: AppDimensions.marginM),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question text
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${questionIndex + 1}. ${question.question}',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  fontSize:
                                      AppTextStyles.bodyMedium.fontSize! *
                                      fontController.fontScale,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: AppDimensions.spaceM),

                        // Options
                        ...question.options.asMap().entries.map((optionEntry) {
                          final optionIndex = optionEntry.key;
                          final option = optionEntry.value;
                          final isSelected = selectedAnswer == optionIndex;
                          final isCorrectOption =
                              optionIndex == question.correctAnswerIndex;

                          Color backgroundColor = AppColors.surface;
                          Color borderColor = AppColors.primary.withValues(
                            alpha: 0.3,
                          );
                          Color textColor = AppColors.textPrimary;

                          if (controller.showResults.value) {
                            if (isSelected && !isCorrect) {
                              // Wrong answer - show in red
                              backgroundColor = AppColors.error.withValues(
                                alpha: 0.2,
                              );
                              borderColor = AppColors.error;
                              textColor = AppColors.error;
                            } else if (isCorrectOption) {
                              // Correct answer - show in green
                              backgroundColor = AppColors.success.withValues(
                                alpha: 0.2,
                              );
                              borderColor = AppColors.success;
                              textColor = AppColors.success;
                            }
                          } else if (isSelected) {
                            backgroundColor = AppColors.primary.withValues(
                              alpha: 0.1,
                            );
                            borderColor = AppColors.primary;
                            textColor = AppColors.primary;
                          }

                          return GestureDetector(
                            onTap: controller.showResults.value
                                ? null
                                : () => controller.selectAnswer(
                                    questionIndex,
                                    optionIndex,
                                  ),
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                bottom: AppDimensions.marginS,
                              ),
                              padding: EdgeInsets.all(AppDimensions.paddingM),
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.radiusS,
                                ),
                                border: Border.all(
                                  color: borderColor,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                option,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  fontSize:
                                      AppTextStyles.bodyMedium.fontSize! *
                                      fontController.fontScale,
                                  color: textColor,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                ),
                                textAlign: option.isPrimarilyArabic
                                    ? TextAlign.right
                                    : TextAlign.left,
                                textDirection: option.isPrimarilyArabic
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                              ),
                            ),
                          );
                        }),

                        // Explanation (if available and results are shown)
                        if (controller.showResults.value &&
                            question.explanation != null) ...[
                          SizedBox(height: AppDimensions.spaceS),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(AppDimensions.paddingM),
                            decoration: BoxDecoration(
                              color: AppColors.info.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusS,
                              ),
                              border: Border.all(
                                color: AppColors.info.withValues(alpha: 0.3),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              'Penjelasan: ${question.explanation!}',
                              style: AppTextStyles.bodySmall.copyWith(
                                fontSize:
                                    AppTextStyles.bodySmall.fontSize! *
                                    fontController.fontScale,
                                color: AppColors.info,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
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
                          'Hasil: ${controller.getCorrectAnswersCount()}/${controller.questions.length}',
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
