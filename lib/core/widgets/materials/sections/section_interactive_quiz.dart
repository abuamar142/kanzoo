import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/app_exercise.dart';
import '../../../constants/app_timing.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_dimensions.dart';
import '../../../theme/app_text_styles.dart';
import '../../../../shared/models/material_content.dart';

class SectionInteractiveQuiz extends StatefulWidget {
  final String title;
  final MaterialInteractiveQuizData quizData;
  final double fontScale;

  const SectionInteractiveQuiz({
    super.key,
    required this.title,
    required this.quizData,
    this.fontScale = 1.0,
  });

  @override
  State<SectionInteractiveQuiz> createState() => _SectionInteractiveQuizState();
}

class _SectionInteractiveQuizState extends State<SectionInteractiveQuiz>
    with TickerProviderStateMixin {
  late List<int?> selectedAnswers;
  late List<bool> questionsChecked;
  late List<bool> questionsAnsweredCorrectly;
  bool showAllResults = false;
  int totalCorrect = 0;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    selectedAnswers = List.filled(widget.quizData.questions.length, null);
    questionsChecked = List.filled(widget.quizData.questions.length, false);
    questionsAnsweredCorrectly = List.filled(
      widget.quizData.questions.length,
      false,
    );

    _animationController = AnimationController(
      duration: Duration(milliseconds: AppTiming.animationDuration),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectAnswer(int questionIndex, int optionIndex) {
    if (!questionsChecked[questionIndex]) {
      setState(() {
        selectedAnswers[questionIndex] = optionIndex;
      });
    }
  }

  void _checkAnswer(int questionIndex) {
    if (selectedAnswers[questionIndex] == null) {
      Get.snackbar(
        'Peringatan',
        'Silakan pilih jawaban terlebih dahulu!',
        backgroundColor: AppColors.warning,
        colorText: AppColors.surface,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: AppTiming.shortTimeLimit),
      );
      return;
    }

    final selectedOptionIndex = selectedAnswers[questionIndex]!;
    final selectedOption =
        widget.quizData.questions[questionIndex].options[selectedOptionIndex];
    final isCorrect = selectedOption.isCorrect;

    setState(() {
      questionsChecked[questionIndex] = true;
      questionsAnsweredCorrectly[questionIndex] = isCorrect;

      if (isCorrect) {
        totalCorrect++;
        _animationController.forward().then(
          (_) => _animationController.reverse(),
        );
      }
    });

    // Show feedback
    String message = isCorrect ? 'Jawaban Benar!' : 'Jawaban Salah!';
    String explanation =
        selectedOption.explanation ??
        widget.quizData.questions[questionIndex].explanation ??
        '';

    if (explanation.isNotEmpty) {
      message += '\n\n$explanation';
    }

    Get.snackbar(
      isCorrect ? 'Benar! 🎉' : 'Salah! 😔',
      message,
      backgroundColor: isCorrect ? AppColors.success : AppColors.error,
      colorText: AppColors.surface,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: AppTiming.defaultTimeLimit),
      maxWidth: double.infinity,
    );
  }

  void _checkAllAnswers() {
    bool allAnswered = selectedAnswers.every((answer) => answer != null);

    if (!allAnswered) {
      Get.snackbar(
        'Peringatan',
        'Silakan jawab semua pertanyaan terlebih dahulu!',
        backgroundColor: AppColors.warning,
        colorText: AppColors.surface,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: AppTiming.shortTimeLimit),
      );
      return;
    }

    // Check all answers
    totalCorrect = 0;
    for (int i = 0; i < widget.quizData.questions.length; i++) {
      if (!questionsChecked[i]) {
        final selectedOptionIndex = selectedAnswers[i]!;
        final selectedOption =
            widget.quizData.questions[i].options[selectedOptionIndex];
        final isCorrect = selectedOption.isCorrect;

        questionsChecked[i] = true;
        questionsAnsweredCorrectly[i] = isCorrect;

        if (isCorrect) {
          totalCorrect++;
        }
      }
    }

    setState(() {
      showAllResults = true;
    });

    if (widget.quizData.showScoreAtEnd) {
      _showScoreDialog();
    }
  }

  void _showScoreDialog() {
    final percentage = (totalCorrect / widget.quizData.questions.length * 100)
        .round();
    final isPassed = percentage >= AppExercise.passingScore;

    Get.dialog(
      AlertDialog(
        title: Row(
          children: [
            Icon(
              isPassed ? Icons.emoji_events : Icons.info_outline,
              color: isPassed ? AppColors.success : AppColors.warning,
              size: AppDimensions.iconL,
            ),
            const SizedBox(width: AppDimensions.spaceS),
            Expanded(
              child: Text(
                isPassed ? 'Selamat!' : 'Coba Lagi!',
                style: AppTextStyles.h4.copyWith(
                  color: isPassed ? AppColors.success : AppColors.warning,
                ),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Skor Anda: $totalCorrect/${widget.quizData.questions.length} ($percentage%)',
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppDimensions.spaceM),
            if (widget.quizData.completionMessage != null) ...[
              Text(
                widget.quizData.completionMessage!,
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: AppDimensions.spaceM),
            ],
            Text(
              isPassed
                  ? 'Excellent! Anda telah menguasai materi ini dengan baik.'
                  : 'Jangan menyerah! Pelajari kembali materinya dan coba lagi.',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        actions: [
          if (!isPassed)
            TextButton(
              onPressed: _resetQuiz,
              child: Text(
                'Coba Lagi',
                style: AppTextStyles.buttonMedium.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'OK',
              style: AppTextStyles.buttonMedium.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  void _resetQuiz() {
    Get.back(); // Close dialog
    setState(() {
      selectedAnswers = List.filled(widget.quizData.questions.length, null);
      questionsChecked = List.filled(widget.quizData.questions.length, false);
      questionsAnsweredCorrectly = List.filled(
        widget.quizData.questions.length,
        false,
      );
      showAllResults = false;
      totalCorrect = 0;
    });
  }

  TextStyle _scaledTextStyle(TextStyle baseStyle) {
    return baseStyle.copyWith(
      fontSize:
          (baseStyle.fontSize ?? AppConstants.materialFontSizeDefault) *
          widget.fontScale,
    );
  }

  TextStyle _scaledTextStyleWith(
    TextStyle baseStyle, {
    Color? color,
    FontWeight? fontWeight,
    double? height,
  }) {
    return baseStyle.copyWith(
      fontSize:
          (baseStyle.fontSize ?? AppConstants.materialFontSizeDefault) *
          widget.fontScale,
      color: color,
      fontWeight: fontWeight,
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingL),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withValues(alpha: AppColors.alpha05),
            blurRadius: AppDimensions.spaceS,
            offset: const Offset(0, AppDimensions.spaceXS),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            children: [
              Icon(
                Icons.quiz,
                color: AppColors.primary,
                size: AppDimensions.iconM,
              ),
              const SizedBox(width: AppDimensions.spaceS),
              Expanded(
                child: Text(
                  widget.title,
                  style: _scaledTextStyleWith(
                    AppTextStyles.h4,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),

          // Instructions
          if (widget.quizData.instructions.isNotEmpty) ...[
            const SizedBox(height: AppDimensions.spaceM),
            Container(
              padding: const EdgeInsets.all(AppDimensions.paddingM),
              decoration: BoxDecoration(
                color: AppColors.info.withValues(alpha: AppColors.alpha05),
                borderRadius: BorderRadius.circular(AppDimensions.radiusS),
                border: Border.all(
                  color: AppColors.info.withValues(alpha: AppColors.alpha20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.quizData.instructions
                    .map(
                      (instruction) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppDimensions.spaceXS,
                        ),
                        child: Text(
                          instruction,
                          style: _scaledTextStyleWith(
                            AppTextStyles.bodyMedium,
                            color: AppColors.info,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],

          const SizedBox(height: AppDimensions.spaceL),

          // Questions
          ...widget.quizData.questions.asMap().entries.map((entry) {
            final questionIndex = entry.key;
            final question = entry.value;
            final isChecked = questionsChecked[questionIndex];
            final isCorrect = questionsAnsweredCorrectly[questionIndex];
            final selectedAnswer = selectedAnswers[questionIndex];

            return AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: isChecked && isCorrect ? _scaleAnimation.value : 1.0,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: AppDimensions.spaceL),
                    padding: const EdgeInsets.all(AppDimensions.paddingL),
                    decoration: BoxDecoration(
                      color: isChecked
                          ? (isCorrect
                                ? AppColors.success.withValues(
                                    alpha: AppColors.alpha10,
                                  )
                                : AppColors.error.withValues(
                                    alpha: AppColors.alpha10,
                                  ))
                          : AppColors.background,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusM,
                      ),
                      border: Border.all(
                        color: isChecked
                            ? (isCorrect
                                  ? AppColors.success.withValues(
                                      alpha: AppColors.alpha30,
                                    )
                                  : AppColors.error.withValues(
                                      alpha: AppColors.alpha30,
                                    ))
                            : AppColors.borderLight,
                        width: isChecked ? 2.0 : 1.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question header
                        Row(
                          children: [
                            Container(
                              width: AppDimensions.iconL,
                              height: AppDimensions.iconL,
                              decoration: BoxDecoration(
                                color: isChecked
                                    ? (isCorrect
                                          ? AppColors.success
                                          : AppColors.error)
                                    : AppColors.primary,
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.radiusCircular,
                                ),
                              ),
                              child: Center(
                                child: isChecked
                                    ? Icon(
                                        isCorrect ? Icons.check : Icons.close,
                                        color: AppColors.surface,
                                        size: AppDimensions.iconS,
                                      )
                                    : Text(
                                        '${questionIndex + 1}',
                                        style: AppTextStyles.bodyMedium
                                            .copyWith(
                                              color: AppColors.surface,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                              ),
                            ),
                            const SizedBox(width: AppDimensions.spaceM),
                            Expanded(
                              child: Text(
                                question.question,
                                style: _scaledTextStyleWith(
                                  AppTextStyles.bodyLarge,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Hint (if available and not checked yet)
                        if (question.hint != null && !isChecked) ...[
                          const SizedBox(height: AppDimensions.spaceS),
                          Container(
                            padding: const EdgeInsets.all(
                              AppDimensions.paddingS,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.warning.withValues(
                                alpha: AppColors.alpha10,
                              ),
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusXS,
                              ),
                              border: Border.all(
                                color: AppColors.warning.withValues(
                                  alpha: AppColors.alpha20,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.lightbulb_outline,
                                  color: AppColors.warning,
                                  size: AppDimensions.iconS,
                                ),
                                const SizedBox(width: AppDimensions.spaceS),
                                Expanded(
                                  child: Text(
                                    'Petunjuk: ${question.hint}',
                                    style: _scaledTextStyleWith(
                                      AppTextStyles.caption,
                                      color: AppColors.warning,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],

                        const SizedBox(height: AppDimensions.spaceM),

                        // Options
                        ...question.options.asMap().entries.map((optionEntry) {
                          final optionIndex = optionEntry.key;
                          final option = optionEntry.value;
                          final isSelected = selectedAnswer == optionIndex;
                          final showResult =
                              isChecked && (isSelected || option.isCorrect);

                          return GestureDetector(
                            onTap: () =>
                                _selectAnswer(questionIndex, optionIndex),
                            child: Container(
                              margin: const EdgeInsets.only(
                                bottom: AppDimensions.spaceS,
                              ),
                              padding: const EdgeInsets.all(
                                AppDimensions.paddingM,
                              ),
                              decoration: BoxDecoration(
                                color: showResult
                                    ? (option.isCorrect
                                          ? AppColors.success.withValues(
                                              alpha: AppColors.alpha20,
                                            )
                                          : (isSelected
                                                ? AppColors.error.withValues(
                                                    alpha: AppColors.alpha20,
                                                  )
                                                : Colors.transparent))
                                    : (isSelected
                                          ? AppColors.primary.withValues(
                                              alpha: AppColors.alpha10,
                                            )
                                          : Colors.transparent),
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.radiusS,
                                ),
                                border: Border.all(
                                  color: showResult
                                      ? (option.isCorrect
                                            ? AppColors.success
                                            : (isSelected
                                                  ? AppColors.error
                                                  : AppColors.borderLight))
                                      : (isSelected
                                            ? AppColors.primary
                                            : AppColors.borderLight),
                                  width: isSelected || showResult ? 2.0 : 1.0,
                                ),
                              ),
                              child: Row(
                                children: [
                                  // Option indicator
                                  Container(
                                    width: AppDimensions.iconM,
                                    height: AppDimensions.iconM,
                                    decoration: BoxDecoration(
                                      color: showResult
                                          ? (option.isCorrect
                                                ? AppColors.success
                                                : (isSelected
                                                      ? AppColors.error
                                                      : Colors.transparent))
                                          : (isSelected
                                                ? AppColors.primary
                                                : Colors.transparent),
                                      borderRadius: BorderRadius.circular(
                                        AppDimensions.radiusCircular,
                                      ),
                                      border: Border.all(
                                        color: showResult
                                            ? (option.isCorrect
                                                  ? AppColors.success
                                                  : (isSelected
                                                        ? AppColors.error
                                                        : AppColors
                                                              .borderLight))
                                            : (isSelected
                                                  ? AppColors.primary
                                                  : AppColors.borderLight),
                                      ),
                                    ),
                                    child: showResult
                                        ? Icon(
                                            option.isCorrect
                                                ? Icons.check
                                                : Icons.close,
                                            color: AppColors.surface,
                                            size: AppDimensions.iconXS,
                                          )
                                        : (isSelected
                                              ? Icon(
                                                  Icons.circle,
                                                  color: AppColors.surface,
                                                  size: AppDimensions.iconXS,
                                                )
                                              : null),
                                  ),
                                  const SizedBox(width: AppDimensions.spaceM),

                                  // Option text
                                  Expanded(
                                    child: Text(
                                      option.text,
                                      style: _scaledTextStyleWith(
                                        AppTextStyles.bodyMedium,
                                        color: showResult
                                            ? (option.isCorrect
                                                  ? AppColors.success
                                                  : (isSelected
                                                        ? AppColors.error
                                                        : AppColors
                                                              .textPrimary))
                                            : AppColors.textPrimary,
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),

                        // Individual check button (only show if not checked yet)
                        if (!isChecked) ...[
                          const SizedBox(height: AppDimensions.spaceM),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _checkAnswer(questionIndex),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.surface,
                                padding: const EdgeInsets.symmetric(
                                  vertical: AppDimensions.paddingM,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppDimensions.radiusS,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Check Jawaban',
                                style: _scaledTextStyle(
                                  AppTextStyles.buttonMedium,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            );
          }),

          // Check all button or results summary
          if (!showAllResults) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppDimensions.paddingL),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: AppColors.alpha05),
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                border: Border.all(
                  color: AppColors.success.withValues(alpha: AppColors.alpha20),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Selesaikan semua pertanyaan untuk melihat skor total',
                    style: _scaledTextStyleWith(
                      AppTextStyles.bodyMedium,
                      color: AppColors.success,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spaceM),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _checkAllAnswers,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success,
                        foregroundColor: AppColors.surface,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppDimensions.paddingM,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusS,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.checklist, size: AppDimensions.iconS),
                          const SizedBox(width: AppDimensions.spaceS),
                          Text(
                            'Check Semua Jawaban',
                            style: _scaledTextStyle(AppTextStyles.buttonMedium),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            // Results summary
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppDimensions.paddingL),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: AppColors.alpha05),
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: AppColors.alpha20),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.emoji_events,
                    color: AppColors.primary,
                    size: AppDimensions.iconXL,
                  ),
                  const SizedBox(height: AppDimensions.spaceM),
                  Text(
                    'Quiz Selesai!',
                    style: _scaledTextStyleWith(
                      AppTextStyles.h4,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spaceS),
                  Text(
                    'Skor: $totalCorrect/${widget.quizData.questions.length}',
                    style: _scaledTextStyleWith(
                      AppTextStyles.bodyLarge,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spaceM),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _resetQuiz,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.surface,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppDimensions.paddingM,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusS,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.refresh, size: AppDimensions.iconS),
                          const SizedBox(width: AppDimensions.spaceS),
                          Text(
                            'Coba Lagi',
                            style: _scaledTextStyle(AppTextStyles.buttonMedium),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
