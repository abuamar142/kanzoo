import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/services/shared_preferences_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/string_extensions.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';
import 'matching_question_section.dart';
import 'material_section.dart';
import 'subtitle_section.dart';

class DragableMatchingController extends GetxController {
  final List<MatchingPair> pairs;
  final String sectionId;

  // Track matched pairs: left item -> right item
  RxMap<String, String> matchedPairs = <String, String>{}.obs;

  // Track available right items for dragging
  RxList<String> availableRightItems = <String>[].obs;

  // Track which drop zones are occupied
  RxMap<String, bool> dropZoneOccupied = <String, bool>{}.obs;

  RxBool showResults = false.obs;

  DragableMatchingController(this.pairs, this.sectionId) {
    // Initialize available right items (shuffled)
    availableRightItems.value = pairs.map((pair) => pair.right).toList()
      ..shuffle();

    // Initialize drop zones as empty
    for (final pair in pairs) {
      dropZoneOccupied[pair.left] = false;
    }

    _loadSavedAnswers();
  }

  void _loadSavedAnswers() {
    final savedMatches = SharedPreferencesService.getDragableMatchingResults(
      sectionId,
    );
    if (savedMatches.isNotEmpty) {
      matchedPairs.value = savedMatches;

      // Update drop zone occupied status
      for (final pair in pairs) {
        dropZoneOccupied[pair.left] = matchedPairs.containsKey(pair.left);
      }

      // Remove matched items from available items
      for (final matchedValue in savedMatches.values) {
        availableRightItems.remove(matchedValue);
      }

      // Check if all answers were matched (meaning answers were checked before)
      if (matchedPairs.length == pairs.length) {
        showResults.value = true;
      }

      update();
    }
  }

  void matchItems(String leftItem, String rightItem) {
    if (!showResults.value) {
      // Remove from previous match if exists
      final existingMatch = matchedPairs.entries
          .where((entry) => entry.value == rightItem)
          .firstOrNull;

      if (existingMatch != null) {
        matchedPairs.remove(existingMatch.key);
        dropZoneOccupied[existingMatch.key] = false;
        availableRightItems.add(rightItem);
      }

      // Remove any existing match for this left item
      if (matchedPairs.containsKey(leftItem)) {
        final previousMatch = matchedPairs[leftItem]!;
        availableRightItems.add(previousMatch);
      }

      // Create new match
      matchedPairs[leftItem] = rightItem;
      dropZoneOccupied[leftItem] = true;
      availableRightItems.remove(rightItem);

      update();
    }
  }

  void unmatchItem(String leftItem) {
    if (!showResults.value && matchedPairs.containsKey(leftItem)) {
      final rightItem = matchedPairs[leftItem]!;
      matchedPairs.remove(leftItem);
      dropZoneOccupied[leftItem] = false;
      availableRightItems.add(rightItem);
      update();
    }
  }

  void checkAllAnswers() async {
    showResults.value = true;
    // Save progress to SharedPreferences
    await SharedPreferencesService.saveDragableMatchingResults(
      sectionId,
      matchedPairs,
    );
    update();
  }

  void resetAnswers() async {
    matchedPairs.clear();
    dropZoneOccupied.updateAll((key, value) => false);
    availableRightItems.value = pairs.map((pair) => pair.right).toList()
      ..shuffle();
    showResults.value = false;
    // Clear saved progress
    await SharedPreferencesService.clearSectionAnswers(sectionId);
    update();
  }

  bool canCheckAnswers() {
    return matchedPairs.length == pairs.length;
  }

  int getCorrectAnswersCount() {
    int correct = 0;
    for (final pair in pairs) {
      if (matchedPairs[pair.left] == pair.right) {
        correct++;
      }
    }
    return correct;
  }

  double getPercentage() {
    if (pairs.isEmpty) return 0.0;
    return (getCorrectAnswersCount() / pairs.length) * 100;
  }

  bool isCorrectMatch(String leftItem, String rightItem) {
    final correctPair = pairs.firstWhereOrNull((pair) => pair.left == leftItem);
    return correctPair?.right == rightItem;
  }

  bool isWrongMatch(String leftItem) {
    if (!matchedPairs.containsKey(leftItem)) return false;
    return !isCorrectMatch(leftItem, matchedPairs[leftItem]!);
  }
}

class DragableMatchingSection extends MaterialSection {
  final String title;
  final String? subtitle;
  final String leftColumnTitle;
  final String rightColumnTitle;
  final List<MatchingPair> pairs;
  final String sectionId;

  const DragableMatchingSection({
    required this.title,
    this.subtitle,
    required this.leftColumnTitle,
    required this.rightColumnTitle,
    required this.pairs,
    required this.sectionId,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DragableMatchingController>(
      init: DragableMatchingController(pairs, sectionId),
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
                // Column headers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SubtitleSection(leftColumnTitle).build(context),
                    SizedBox(width: AppDimensions.spaceM),
                    SubtitleSection(rightColumnTitle).build(context),
                  ],
                ),
                SizedBox(height: AppDimensions.spaceM),

                // Main matching area - Two columns for questions
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left column - drop zones
                    Expanded(
                      child: Column(
                        children: pairs.asMap().entries.map((entry) {
                          final pairIndex = entry.key;
                          final pair = entry.value;
                          final isMatched = controller.matchedPairs.containsKey(
                            pair.left,
                          );
                          final matchedItem =
                              controller.matchedPairs[pair.left];
                          final isCorrect =
                              controller.showResults.value &&
                              controller.isCorrectMatch(
                                pair.left,
                                matchedItem ?? '',
                              );
                          final isWrong =
                              controller.showResults.value &&
                              controller.isWrongMatch(pair.left);

                          return Container(
                            margin: EdgeInsets.only(
                              bottom: AppDimensions.marginL,
                            ),
                            child: Row(
                              children: [
                                // Left item
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      AppDimensions.paddingM,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withValues(
                                        alpha: 0.1,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        AppDimensions.radiusS,
                                      ),
                                      border: Border.all(
                                        color: AppColors.primary.withValues(
                                          alpha: 0.3,
                                        ),
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      '${pairIndex + 1}. ${pair.left}',
                                      style: AppTextStyles.bodySmall.copyWith(
                                        fontSize:
                                            AppTextStyles.bodySmall.fontSize! *
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
                                SizedBox(width: AppDimensions.spaceL),

                                // Drop zone
                                Expanded(
                                  child: DragTarget<String>(
                                    onAcceptWithDetails: (details) {
                                      controller.matchItems(
                                        pair.left,
                                        details.data,
                                      );
                                    },
                                    builder: (context, candidateData, rejectedData) {
                                      final isHovering =
                                          candidateData.isNotEmpty;
                                      Color borderColor = AppColors.primary
                                          .withValues(alpha: 0.3);
                                      Color backgroundColor = AppColors.surface;

                                      if (controller.showResults.value) {
                                        if (isCorrect) {
                                          borderColor = AppColors.success;
                                          backgroundColor = AppColors.success
                                              .withValues(alpha: 0.1);
                                        } else if (isWrong) {
                                          borderColor = AppColors.error;
                                          backgroundColor = AppColors.error
                                              .withValues(alpha: 0.1);
                                        }
                                      } else if (isHovering) {
                                        borderColor = AppColors.primary;
                                        backgroundColor = AppColors.primary
                                            .withValues(alpha: 0.1);
                                      }

                                      return GestureDetector(
                                        onTap:
                                            isMatched &&
                                                !controller.showResults.value
                                            ? () => controller.unmatchItem(
                                                pair.left,
                                              )
                                            : null,
                                        child: Container(
                                          padding: EdgeInsets.all(
                                            AppDimensions.paddingM,
                                          ),
                                          decoration: BoxDecoration(
                                            color: backgroundColor,
                                            borderRadius: BorderRadius.circular(
                                              AppDimensions.radiusS,
                                            ),
                                            border: Border.all(
                                              color: borderColor,
                                              width: isHovering ? 2 : 1,
                                            ),
                                          ),
                                          child: Center(
                                            child: isMatched
                                                ? Text(
                                                    matchedItem!,
                                                    style: AppTextStyles
                                                        .bodySmall
                                                        .copyWith(
                                                          fontSize:
                                                              AppTextStyles
                                                                  .bodySmall
                                                                  .fontSize! *
                                                              fontController
                                                                  .fontScale,
                                                          color:
                                                              controller
                                                                  .showResults
                                                                  .value
                                                              ? (isCorrect
                                                                    ? AppColors
                                                                          .success
                                                                    : AppColors
                                                                          .error)
                                                              : AppColors
                                                                    .textPrimary,
                                                        ),
                                                    textAlign:
                                                        matchedItem
                                                            .isPrimarilyArabic
                                                        ? TextAlign.right
                                                        : TextAlign.center,
                                                    textDirection:
                                                        matchedItem
                                                            .isPrimarilyArabic
                                                        ? TextDirection.rtl
                                                        : TextDirection.ltr,
                                                  )
                                                : Text(
                                                    'Seret jawaban ke sini',
                                                    style: AppTextStyles.caption
                                                        .copyWith(
                                                          fontSize:
                                                              AppTextStyles
                                                                  .caption
                                                                  .fontSize! *
                                                              fontController
                                                                  .fontScale,
                                                          color: AppColors
                                                              .textHint,
                                                        ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),

                // Draggable items section - spans full width at bottom
                if (controller.availableRightItems.isNotEmpty) ...[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppDimensions.paddingM),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusM,
                      ),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Pilihan Jawaban:',
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize:
                                AppTextStyles.bodyMedium.fontSize! *
                                fontController.fontScale,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: AppDimensions.spaceS),

                        // Available items to drag
                        Wrap(
                          spacing: AppDimensions.spaceS,
                          runSpacing: AppDimensions.spaceS,
                          alignment: WrapAlignment.center,
                          children: controller.availableRightItems.map((item) {
                            return Draggable<String>(
                              data: item,
                              feedback: Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.radiusS,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppDimensions.paddingS,
                                    vertical: AppDimensions.paddingXS,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(
                                      AppDimensions.radiusS,
                                    ),
                                  ),
                                  child: Text(
                                    item,
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.surface,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              childWhenDragging: Container(
                                padding: EdgeInsets.all(AppDimensions.paddingM),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.3,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.radiusS,
                                  ),
                                  border: Border.all(
                                    color: AppColors.primary.withValues(
                                      alpha: 0.5,
                                    ),
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                  item,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    fontSize:
                                        AppTextStyles.bodySmall.fontSize! *
                                        fontController.fontScale,
                                    color: AppColors.primary.withValues(
                                      alpha: 0.7,
                                    ),
                                  ),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(AppDimensions.paddingM),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.radiusS,
                                  ),
                                  border: Border.all(
                                    color: AppColors.primary.withValues(
                                      alpha: 0.3,
                                    ),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  item,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    fontSize:
                                        AppTextStyles.bodySmall.fontSize! *
                                        fontController.fontScale,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: item.isPrimarilyArabic
                                      ? TextAlign.right
                                      : TextAlign.left,
                                  textDirection: item.isPrimarilyArabic
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],

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
                      'Cocokkan semua pasangan terlebih dahulu',
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
