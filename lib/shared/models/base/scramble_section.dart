import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/services/shared_preferences_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import 'material_section.dart';
import 'scramble_dialog.dart';
import 'scramble_item.dart';

class ScrambleSection extends MaterialSection {
  final List<ScrambleSentence> sentences;
  final String sectionId;

  const ScrambleSection({required this.sentences, required this.sectionId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScrambleSectionController>(
      init: ScrambleSectionController(sentences, sectionId),
      builder: (controller) {
        return Container(
          padding: EdgeInsets.all(AppDimensions.paddingM),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            border: Border.all(color: _getSectionBorderColor(controller)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...controller.scrambledSentences.asMap().entries.map((entry) {
                int sentenceIndex = entry.key;

                return Container(
                  margin: EdgeInsets.only(bottom: AppDimensions.marginM),
                  child: Column(
                    children: [
                      // Arabic number and sentence area
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Clickable area to open scramble dialog
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _handleScrambleTap(
                                sentenceIndex,
                                controller
                                    .scrambledSentences[sentenceIndex]
                                    .correctOrder,
                              ),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: 120.0, // Minimum height
                                ),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(
                                    AppDimensions.paddingM,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.background,
                                    borderRadius: BorderRadius.circular(
                                      AppDimensions.radiusM,
                                    ),
                                    border: Border.all(
                                      color: controller.getValidationColor(
                                        sentenceIndex,
                                      ),
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Wrap(
                                        textDirection: TextDirection.rtl,
                                        alignment: WrapAlignment.center,
                                        spacing: AppDimensions.spaceS,
                                        runSpacing: AppDimensions.spaceS,
                                        children:
                                            _getDisplayOrder(
                                                  controller,
                                                  sentenceIndex,
                                                )
                                                .map(
                                                  (item) => ScrambleItem(
                                                    text: item,
                                                    isDragging: false,
                                                  ),
                                                )
                                                .toList(),
                                      ),
                                      SizedBox(height: AppDimensions.spaceM),
                                      // Instruction text
                                      _buildInstructionText(sentenceIndex),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: AppDimensions.spaceM),
                          // Arabic number
                          Container(
                            width: AppDimensions.iconL,
                            height: AppDimensions.iconL,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusCircular,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                _getArabicNumber(sentenceIndex + 1),
                                style: AppTextStyles.arabicText.copyWith(
                                  color: AppColors.surface,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppDimensions.spaceS),
                      // Validation result
                      if (controller.validationResults[sentenceIndex] != null)
                        Container(
                          padding: EdgeInsets.all(AppDimensions.paddingS),
                          decoration: BoxDecoration(
                            color: controller.validationResults[sentenceIndex]!
                                ? AppColors.success.withValues(
                                    alpha: AppColors.alpha10,
                                  )
                                : AppColors.error.withValues(
                                    alpha: AppColors.alpha10,
                                  ),
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusS,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                controller.validationResults[sentenceIndex]!
                                    ? Icons.check_circle
                                    : Icons.error,
                                color:
                                    controller.validationResults[sentenceIndex]!
                                    ? AppColors.success
                                    : AppColors.error,
                                size: AppDimensions.iconS,
                              ),
                              SizedBox(width: AppDimensions.spaceS),
                              Expanded(
                                child: Text(
                                  controller.validationResults[sentenceIndex]!
                                      ? AppConstants.correctArrangement
                                      : AppConstants.incorrectArrangement,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color:
                                        controller
                                            .validationResults[sentenceIndex]!
                                        ? AppColors.success
                                        : AppColors.error,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  void _handleScrambleTap(int questionNumber, List<String> correctOrder) {
    // Check if this question is already completed
    final scrambleId = '${sectionId}_question_$questionNumber';
    final isCompleted = SharedPreferencesService.isScrambleCompleted(
      scrambleId,
    );

    // Only open dialog if not completed
    if (!isCompleted) {
      _openScrambleDialog(questionNumber, correctOrder);
    }
  }

  void _openScrambleDialog(int questionNumber, List<String> correctOrder) {
    Get.dialog(
      ScrambleDialog(
        correctOrder: correctOrder,
        questionNumber: questionNumber + 1,
        scrambleId: '${sectionId}_question_$questionNumber',
        onAnswerCorrect: () {
          // Refresh UI when answer is correct
          final controller = Get.find<ScrambleSectionController>();
          controller.update();
        },
      ),
      barrierDismissible: true,
    );
  }

  Color _getSectionBorderColor(ScrambleSectionController controller) {
    // Check if all questions in this section are completed
    bool allCompleted = true;
    for (int i = 0; i < sentences.length; i++) {
      final scrambleId = '${sectionId}_question_$i';
      if (!SharedPreferencesService.isScrambleCompleted(scrambleId)) {
        allCompleted = false;
        break;
      }
    }

    if (allCompleted) {
      return AppColors.success;
    }

    return AppColors.primary.withValues(alpha: AppColors.alpha20);
  }

  List<String> _getDisplayOrder(
    ScrambleSectionController controller,
    int sentenceIndex,
  ) {
    // Check if this specific scramble question is completed
    final scrambleId = '${sectionId}_question_$sentenceIndex';
    final isCompleted = SharedPreferencesService.isScrambleCompleted(
      scrambleId,
    );

    if (isCompleted) {
      // Show correct order when completed
      return controller.scrambledSentences[sentenceIndex].correctOrder;
    } else {
      // Show scrambled order when not completed
      return controller.scrambledSentences[sentenceIndex].currentOrder;
    }
  }

  Widget _buildInstructionText(int sentenceIndex) {
    final scrambleId = '${sectionId}_question_$sentenceIndex';
    final isCompleted = SharedPreferencesService.isScrambleCompleted(
      scrambleId,
    );

    if (isCompleted) {
      // Show completion message
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle,
            color: AppColors.success,
            size: AppDimensions.iconS,
          ),
          SizedBox(width: AppDimensions.spaceS),
          Text(
            AppConstants.alreadyCorrectText,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.success,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    } else {
      // Show instruction to tap
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.touch_app,
            color: AppColors.primary,
            size: AppDimensions.iconS,
          ),
          SizedBox(width: AppDimensions.spaceS),
          Text(
            AppConstants.tapToArrangeText,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }
  }

  String _getArabicNumber(int number) {
    const arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return number
        .toString()
        .split('')
        .map((digit) => arabicNumbers[int.parse(digit)])
        .join();
  }
}

class ScrambleData {
  final int sentenceIndex;
  final int itemIndex;
  final String text;

  ScrambleData({
    required this.sentenceIndex,
    required this.itemIndex,
    required this.text,
  });
}

class ScrambleSentence {
  final List<String> correctOrder;
  List<String> currentOrder;

  ScrambleSentence({required this.correctOrder, List<String>? scrambledOrder})
    : currentOrder = scrambledOrder ?? List.from(correctOrder);

  bool get isCorrect {
    if (correctOrder.length != currentOrder.length) return false;
    for (int i = 0; i < correctOrder.length; i++) {
      if (correctOrder[i] != currentOrder[i]) return false;
    }
    return true;
  }

  void scramble() {
    final random = Random();
    do {
      currentOrder.shuffle(random);
    } while (isCorrect && correctOrder.length > 1);
  }

  void reset() {
    currentOrder = List.from(correctOrder);
    scramble();
  }
}

class ScrambleSectionController extends GetxController {
  final List<ScrambleSentence> originalSentences;
  final String sectionId;
  late List<ScrambleSentence> scrambledSentences;
  List<bool?> validationResults = [];

  ScrambleSectionController(this.originalSentences, this.sectionId) {
    resetScramble();
  }

  void resetScramble() {
    scrambledSentences = originalSentences.map((sentence) {
      final newSentence = ScrambleSentence(correctOrder: sentence.correctOrder);
      newSentence.scramble();
      return newSentence;
    }).toList();

    validationResults = List.filled(scrambledSentences.length, null);
    update();
  }

  void reorderItems(int sentenceIndex, int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final item = scrambledSentences[sentenceIndex].currentOrder.removeAt(
      oldIndex,
    );
    scrambledSentences[sentenceIndex].currentOrder.insert(newIndex, item);

    // Clear validation result for this sentence when items are moved
    validationResults[sentenceIndex] = null;
    update();
  }

  void moveItemToEnd(int sentenceIndex, int itemIndex) {
    final item = scrambledSentences[sentenceIndex].currentOrder.removeAt(
      itemIndex,
    );
    scrambledSentences[sentenceIndex].currentOrder.add(item);

    // Clear validation result for this sentence when items are moved
    validationResults[sentenceIndex] = null;
    update();
  }

  void moveItemToFront(int sentenceIndex, int itemIndex) {
    final item = scrambledSentences[sentenceIndex].currentOrder.removeAt(
      itemIndex,
    );
    scrambledSentences[sentenceIndex].currentOrder.insert(0, item);

    // Clear validation result for this sentence when items are moved
    validationResults[sentenceIndex] = null;
    update();
  }

  void checkArrangements() {
    for (int i = 0; i < scrambledSentences.length; i++) {
      validationResults[i] = scrambledSentences[i].isCorrect;
    }
    update();
  }

  Color getValidationColor(int sentenceIndex) {
    // Check if this specific scramble question is completed
    final scrambleId = '${sectionId}_question_$sentenceIndex';
    final isCompleted = SharedPreferencesService.isScrambleCompleted(
      scrambleId,
    );

    if (isCompleted) {
      return AppColors.success;
    }

    if (validationResults[sentenceIndex] == null) {
      return AppColors.primary.withValues(alpha: AppColors.alpha20);
    }
    return validationResults[sentenceIndex]!
        ? AppColors.success
        : AppColors.error;
  }
}
