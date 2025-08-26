import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/services/shared_preferences_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/app_snackbar.dart';
import '../../../core/utils/string_extensions.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';
import 'audio_exercise.dart';
import 'material_section.dart';

class MatchingSection extends MaterialSection {
  final List<AudioExercise> exercises;
  final String sectionId;

  const MatchingSection({required this.exercises, required this.sectionId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IstimaMatchingSectionController>(
      init: IstimaMatchingSectionController(exercises, sectionId),
      builder: (controller) {
        return Obx(() {
          final fontController = Get.find<FontSizeController>();

          final scaledTextStyle = AppTextStyles.bodyMedium.copyWith(
            fontSize:
                AppTextStyles.bodyMedium.fontSize! * (fontController.fontScale),
          );

          final scaledQuestionStyle = AppTextStyles.bodyLarge.copyWith(
            fontSize:
                AppTextStyles.bodyLarge.fontSize! * (fontController.fontScale),
            fontWeight: FontWeight.w600,
          );

          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.paddingM,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Exercise instructions
                Container(
                  padding: const EdgeInsets.all(AppDimensions.paddingM),
                  decoration: BoxDecoration(
                    color: AppColors.info.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                    border: Border.all(
                      color: AppColors.info.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.headphones,
                        color: AppColors.info,
                        size: AppDimensions.iconM,
                      ),
                      const SizedBox(width: AppDimensions.spaceS),
                      Expanded(
                        child: Text(
                          AppConstants.listenAndMatchInstruction,
                          style: scaledTextStyle.copyWith(
                            color: AppColors.info,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppDimensions.spaceL),

                // Exercise items
                ...exercises.asMap().entries.map((entry) {
                  final index = entry.key;
                  final exercise = entry.value;

                  return _buildExerciseItem(
                    controller,
                    index,
                    exercise,
                    scaledTextStyle,
                    scaledQuestionStyle,
                  );
                }),
              ],
            ),
          );
        });
      },
    );
  }

  Widget _buildExerciseItem(
    IstimaMatchingSectionController controller,
    int index,
    AudioExercise exercise,
    TextStyle textStyle,
    TextStyle questionStyle,
  ) {
    final isCompleted = controller.isExerciseCompleted(index);
    final selectedAnswer = controller.selectedAnswers[index];
    final isCorrect = controller.isAnswerCorrect(index);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.spaceL),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        decoration: BoxDecoration(
          color: isCompleted
              ? (isCorrect
                    ? AppColors.success.withValues(alpha: 0.1)
                    : AppColors.error.withValues(alpha: 0.1))
              : AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          border: Border.all(
            color: isCompleted
                ? (isCorrect ? AppColors.success : AppColors.error)
                : AppColors.primary.withValues(alpha: 0.3),
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Question number and audio button
            Row(
              children: [
                // Question number
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingS,
                    vertical: AppDimensions.paddingXS,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusS),
                  ),
                  child: Text(
                    _getArabicNumber(index + 1),
                    style: questionStyle.copyWith(color: AppColors.primary),
                  ),
                ),
                const SizedBox(width: AppDimensions.spaceM),

                // Audio play button
                GestureDetector(
                  onTap: () => controller.playAudio(exercise.audioFile),
                  child: Container(
                    padding: const EdgeInsets.all(AppDimensions.paddingS),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusCircular,
                      ),
                    ),
                    child: Icon(
                      controller.isPlaying.value &&
                              controller.currentPlayingFile.value ==
                                  exercise.audioFile
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: AppColors.background,
                      size: AppDimensions.iconM,
                    ),
                  ),
                ),
                const SizedBox(width: AppDimensions.spaceS),

                // Audio file indicator
                Expanded(
                  child: Text(
                    'Audio ${index + 1}',
                    style: textStyle.copyWith(
                      color: AppColors.textSecondary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spaceM),

            // Question text
            Text(
              exercise.question,
              style: questionStyle,
              textAlign: exercise.question.isPrimarilyArabic
                  ? TextAlign.right
                  : TextAlign.left,
              textDirection: exercise.question.isPrimarilyArabic
                  ? TextDirection.rtl
                  : TextDirection.ltr,
            ),
            const SizedBox(height: AppDimensions.spaceM),

            // Matching options
            Wrap(
              spacing: AppDimensions.spaceS,
              runSpacing: AppDimensions.spaceS,
              children: exercise.options.asMap().entries.map((optionEntry) {
                final optionIndex = optionEntry.key;
                final option = optionEntry.value;
                final isSelected = selectedAnswer == optionIndex;
                final isCorrectOption =
                    optionIndex == exercise.correctAnswerIndex;

                Color backgroundColor = AppColors.surface;
                Color borderColor = AppColors.primary.withValues(alpha: 0.3);
                Color textColor = AppColors.textPrimary;

                if (isCompleted) {
                  if (isCorrectOption) {
                    backgroundColor = AppColors.success.withValues(alpha: 0.2);
                    borderColor = AppColors.success;
                    textColor = AppColors.success;
                  } else if (isSelected && !isCorrect) {
                    backgroundColor = AppColors.error.withValues(alpha: 0.2);
                    borderColor = AppColors.error;
                    textColor = AppColors.error;
                  }
                } else if (isSelected) {
                  backgroundColor = AppColors.primary.withValues(alpha: 0.1);
                  borderColor = AppColors.primary;
                  textColor = AppColors.primary;
                }

                return GestureDetector(
                  onTap: isCompleted
                      ? null
                      : () => controller.selectAnswer(index, optionIndex),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingM,
                      vertical: AppDimensions.paddingS,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusS,
                      ),
                      border: Border.all(color: borderColor, width: 1),
                    ),
                    child: Text(
                      option,
                      style: textStyle.copyWith(
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
              }).toList(),
            ),

            // Result indicator
            if (isCompleted) ...[
              const SizedBox(height: AppDimensions.spaceM),
              Row(
                children: [
                  Icon(
                    isCorrect ? Icons.check_circle : Icons.cancel,
                    color: isCorrect ? AppColors.success : AppColors.error,
                    size: AppDimensions.iconS,
                  ),
                  const SizedBox(width: AppDimensions.spaceXS),
                  Text(
                    isCorrect
                        ? AppConstants.correctAnswerText
                        : AppConstants.wrongAnswerText,
                    style: textStyle.copyWith(
                      color: isCorrect ? AppColors.success : AppColors.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
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

class IstimaMatchingSectionController extends GetxController {
  final List<AudioExercise> exercises;
  final String sectionId;

  late AudioPlayer _audioPlayer;
  RxBool isPlaying = false.obs;
  RxString currentPlayingFile = ''.obs;

  List<int?> selectedAnswers = [];
  List<bool> completedExercises = [];

  IstimaMatchingSectionController(this.exercises, this.sectionId) {
    _audioPlayer = AudioPlayer();
    selectedAnswers = List.filled(exercises.length, null);
    completedExercises = List.filled(exercises.length, false);

    // Load completed exercises from SharedPreferences
    _loadCompletedExercises();

    // Listen for audio player state changes
    _audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying.value = state == PlayerState.playing;
      if (state == PlayerState.completed || state == PlayerState.stopped) {
        currentPlayingFile.value = '';
      }
    });
  }

  void _loadCompletedExercises() {
    for (int i = 0; i < exercises.length; i++) {
      final exerciseId = '${sectionId}_exercise_$i';
      completedExercises[i] =
          SharedPreferencesService.isIstimaExerciseCompleted(exerciseId);
      if (completedExercises[i]) {
        selectedAnswers[i] = exercises[i].correctAnswerIndex;
      }
    }
    update();
  }

  Future<void> playAudio(String audioFile) async {
    try {
      if (currentPlayingFile.value == audioFile && isPlaying.value) {
        await _audioPlayer.pause();
      } else {
        currentPlayingFile.value = audioFile;
        await _audioPlayer.play(
          AssetSource('materials/materi-istima/$audioFile'),
        );
      }
    } catch (e) {
      AppSnackbar.showError(
        message: 'Gagal memutar audio. Pastikan file audio tersedia.',
        title: 'Error Audio',
      );
    }
  }

  void selectAnswer(int exerciseIndex, int answerIndex) {
    if (completedExercises[exerciseIndex]) return;

    selectedAnswers[exerciseIndex] = answerIndex;

    // Check if answer is correct
    final isCorrect =
        answerIndex == exercises[exerciseIndex].correctAnswerIndex;
    if (isCorrect) {
      completedExercises[exerciseIndex] = true;
      final exerciseId = '${sectionId}_exercise_$exerciseIndex';
      SharedPreferencesService.markIstimaExerciseCompleted(exerciseId);
    }

    update();
  }

  bool isExerciseCompleted(int index) {
    return completedExercises[index];
  }

  bool isAnswerCorrect(int index) {
    if (selectedAnswers[index] == null) return false;
    return selectedAnswers[index] == exercises[index].correctAnswerIndex;
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}
