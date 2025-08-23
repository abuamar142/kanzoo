import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import 'material_section.dart';
import 'scramble_dialog.dart';
import 'scramble_item.dart';

class ScrambleSection extends MaterialSection {
  final List<ScrambleSentence> sentences;

  const ScrambleSection({required this.sentences});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScrambleSectionController>(
      init: ScrambleSectionController(sentences),
      builder: (controller) {
        return Container(
          padding: EdgeInsets.all(AppDimensions.paddingM),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: AppColors.alpha20),
            ),
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
                              onTap: () => _openScrambleDialog(
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
                                      // Show randomized sentence preview
                                      Wrap(
                                        alignment: WrapAlignment.center,
                                        spacing: AppDimensions.spaceS,
                                        runSpacing: AppDimensions.spaceS,
                                        children: controller
                                            .scrambledSentences[sentenceIndex]
                                            .currentOrder
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.touch_app,
                                            color: AppColors.primary,
                                            size: AppDimensions.iconS,
                                          ),
                                          SizedBox(width: AppDimensions.spaceS),
                                          Text(
                                            'Ketuk untuk menyusun kalimat',
                                            style: AppTextStyles.caption
                                                .copyWith(
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
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

  void _openScrambleDialog(int questionNumber, List<String> correctOrder) {
    Get.dialog(
      ScrambleDialog(
        correctOrder: correctOrder,
        questionNumber: questionNumber + 1,
      ),
      barrierDismissible: true,
    );
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
  late List<ScrambleSentence> scrambledSentences;
  List<bool?> validationResults = [];

  ScrambleSectionController(this.originalSentences) {
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
    if (validationResults[sentenceIndex] == null) {
      return AppColors.primary.withValues(alpha: AppColors.alpha20);
    }
    return validationResults[sentenceIndex]!
        ? AppColors.success
        : AppColors.error;
  }
}
