import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/services/shared_preferences_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/app_snackbar.dart';
import '../../../core/utils/string_extensions.dart';
import 'scramble_item.dart';

class ScrambleDialog extends StatefulWidget {
  final List<String> correctOrder;
  final int questionNumber;
  final String scrambleId;
  final VoidCallback? onAnswerCorrect;

  const ScrambleDialog({
    super.key,
    required this.correctOrder,
    required this.questionNumber,
    required this.scrambleId,
    this.onAnswerCorrect,
  });

  @override
  State<ScrambleDialog> createState() => _ScrambleDialogState();
}

class _ScrambleDialogState extends State<ScrambleDialog> {
  late ScrambleDialogController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrambleDialogController(
      widget.correctOrder,
      widget.scrambleId,
      widget.onAnswerCorrect,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(AppDimensions.paddingM),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusL),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withValues(alpha: AppColors.alpha20),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with question number and close button
            _buildHeader(),

            // Content area
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppDimensions.paddingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Empty places for answer
                    _buildAnswerArea(),
                    SizedBox(height: AppDimensions.spaceXL),

                    // Scrambled items at bottom
                    _buildScrambledItemsArea(),

                    // Check button and clear button
                    SizedBox(height: AppDimensions.spaceL),
                    _buildActionButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radiusL),
          topRight: Radius.circular(AppDimensions.radiusL),
        ),
      ),
      child: Row(
        children: [
          // Arabic question number
          Container(
            width: AppDimensions.iconL,
            height: AppDimensions.iconL,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppDimensions.radiusCircular),
            ),
            child: Center(
              child: Text(
                _getArabicNumber(widget.questionNumber),
                style: AppTextStyles.arabicText.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: AppDimensions.spaceM),
          Expanded(
            child: Text(
              'Susun kalimat yang benar',
              style: AppTextStyles.h4.copyWith(color: AppColors.surface),
            ),
          ),
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.close,
              color: AppColors.surface,
              size: AppDimensions.iconM,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Obx(() {
      final isComplete = controller.isAnswerComplete;

      return SizedBox(
        height: AppDimensions.buttonHeight,
        child: ElevatedButton(
          onPressed: isComplete ? () => controller.checkAnswer() : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: isComplete
                ? AppColors.primary
                : AppColors.textHint,
            foregroundColor: AppColors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            ),
          ),
          child: Text(
            AppConstants.checkAnswerButtonText,
            style: AppTextStyles.buttonMedium,
          ),
        ),
      );
    });
  }

  Widget _buildAnswerArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Susun kata-kata di bawah ini:',
          style: AppTextStyles.h4.copyWith(color: AppColors.textPrimary),
        ),
        SizedBox(height: AppDimensions.spaceM),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(AppDimensions.paddingM),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: AppColors.alpha20),
              width: 2,
            ),
          ),
          child: Obx(() {
            final hasAnyWords = controller.answerOrder.any(
              (item) => item != null,
            );

            if (hasAnyWords) {
              return Wrap(
                textDirection: TextDirection.rtl,
                alignment: WrapAlignment.center,
                spacing: AppDimensions.spaceS,
                runSpacing: AppDimensions.spaceS,
                children: List.generate(
                  widget.correctOrder.length,
                  (index) => _buildAnswerSlot(index),
                ),
              );
            } else {
              return SizedBox(
                width: double.infinity,
                height: 40,
                child: Center(
                  child: Text(
                    'Ketuk kata di bawah untuk menyusun kalimat',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textHint,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
          }),
        ),
      ],
    );
  }

  Widget _buildAnswerSlot(int index) {
    final item = controller.answerOrder[index];
    final isEmpty = item == null;

    return Container(
      constraints: BoxConstraints(minWidth: 60.0),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingM,
        vertical: AppDimensions.paddingS,
      ),
      decoration: BoxDecoration(
        color: isEmpty
            ? Colors.transparent
            : AppColors.primary.withValues(alpha: AppColors.alpha10),
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        border: Border.all(
          color: isEmpty ? AppColors.borderLight : AppColors.primary,
          width: isEmpty ? 2 : 1,
        ),
      ),
      child: isEmpty
          ? Text(
              '${index + 1}',
              textAlign: TextAlign.center,
              style: AppTextStyles.caption.copyWith(color: AppColors.textHint),
            )
          : GestureDetector(
              onTap: () => controller.removeItemFromSlot(index),
              child: Text(
                item,
                style: item.isArabic
                    ? AppTextStyles.arabicText.copyWith(
                        color: AppColors.primary,
                        decoration: controller.isWordUnderlined(item)
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: AppColors.primary,
                        decorationThickness: 2,
                      )
                    : AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                        decoration: controller.isWordUnderlined(item)
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: AppColors.primary,
                        decorationThickness: 2,
                      ),
                textDirection: item.isArabic
                    ? TextDirection.rtl
                    : TextDirection.ltr,
              ),
            ),
    );
  }

  Widget _buildScrambledItemsArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pilih kata yang sesuai:',
          style: AppTextStyles.h4.copyWith(color: AppColors.textPrimary),
        ),
        SizedBox(height: AppDimensions.spaceM),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(AppDimensions.paddingM),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Obx(() {
            final hasAvailableItems = controller.availableItems.isNotEmpty;

            if (hasAvailableItems) {
              return Wrap(
                alignment: WrapAlignment.center,
                spacing: AppDimensions.spaceS,
                runSpacing: AppDimensions.spaceS,
                children: controller.availableItems
                    .map((item) => _buildDraggableItem(item))
                    .toList(),
              );
            } else {
              return SizedBox(
                width: double.infinity,
                height: 40,
                child: Center(
                  child: Text(
                    'Semua kata telah digunakan',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textHint,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
          }),
        ),
      ],
    );
  }

  Widget _buildDraggableItem(String item) {
    return ScrambleItem(
      text: item,
      isDragging: false,
      isUnderlined: controller.isWordUnderlined(item),
      onTap: () => controller.addItemToNextSlot(item),
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

class ScrambleDialogController extends GetxController {
  final List<String> correctOrder;
  final String scrambleId;
  final VoidCallback? onAnswerCorrect;
  late RxList<String?> answerOrder;
  late RxList<String> availableItems;
  late RxList<String> scrambledItems;

  ScrambleDialogController(
    this.correctOrder,
    this.scrambleId,
    this.onAnswerCorrect,
  ) {
    _initializeData();
  }

  void _initializeData() {
    // Initialize empty answer slots
    answerOrder = List<String?>.filled(correctOrder.length, null).obs;

    // Create scrambled items
    scrambledItems = List<String>.from(correctOrder).obs;
    scrambledItems.shuffle();
    availableItems = List<String>.from(scrambledItems).obs;
  }

  bool get isAnswerComplete {
    return answerOrder.every((item) => item != null);
  }

  bool get isAnswerCorrect {
    if (!isAnswerComplete) return false;

    for (int i = 0; i < correctOrder.length; i++) {
      if (answerOrder[i] != correctOrder[i]) {
        return false;
      }
    }
    return true;
  }

  void removeItemFromSlot(int slotIndex) {
    final item = answerOrder[slotIndex];
    if (item != null) {
      answerOrder[slotIndex] = null;
      availableItems.add(item);
    }
  }

  void addItemToNextSlot(String item) {
    // Add item to the first empty slot (sequential order)
    final emptyIndex = answerOrder.indexWhere((slot) => slot == null);
    if (emptyIndex != -1) {
      answerOrder[emptyIndex] = item;
      availableItems.remove(item);
    }
  }

  void checkAnswer() {
    if (isAnswerCorrect) {
      // Save completion status to shared preferences
      SharedPreferencesService.setScrambleCompleted(scrambleId, true);

      AppSnackbar.showSuccess(
        message: AppConstants.correctArrangement,
        duration: const Duration(seconds: 2),
      );

      // Close dialog after a short delay and trigger parent update
      Future.delayed(const Duration(milliseconds: 1500), () {
        Get.back();
        // Notify parent that answer was correct
        if (onAnswerCorrect != null) {
          onAnswerCorrect!();
        }
      });
    } else {
      AppSnackbar.showError(
        message: AppConstants.incorrectArrangement,
        duration: const Duration(seconds: 3),
      );
    }
  }

  bool isWordUnderlined(String word) {
    return correctOrder.isNotEmpty && word == correctOrder[0];
  }
}
