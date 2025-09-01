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
import '../../../core/widgets/materials/components/check_all_answers_button.dart';
import '../../../core/widgets/materials/components/exercise_container.dart';
import '../../../core/widgets/materials/components/exercise_header.dart';
import '../../../core/widgets/materials/components/exercise_options.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';
import '../../enum/chapter.dart';
import 'audio_exercise.dart';
import 'material_section.dart';

class CompletionSection extends MaterialSection {
  final List<AudioExercise> exercises;
  final String sectionId;

  const CompletionSection({required this.exercises, required this.sectionId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IstimaCompletionSectionController>(
      init: IstimaCompletionSectionController(exercises, sectionId),
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
                        Icons.edit_note,
                        color: AppColors.info,
                        size: AppDimensions.iconM,
                      ),
                      const SizedBox(width: AppDimensions.spaceS),
                      Expanded(
                        child: Text(
                          AppConstants.listenAndCompleteInstruction,
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

                // Check All Answers Button
                const SizedBox(height: AppDimensions.spaceL),
                CheckAllAnswersButton(
                  onPressed: () => controller.checkAllAnswers(),
                  isEnabled: controller.canCheckAnswers(),
                  showResults: controller.showResults.value,
                  correctAnswers: controller.getCorrectAnswersCount(),
                  totalQuestions: exercises.length,
                  textStyle: scaledTextStyle,
                ),
              ],
            ),
          );
        });
      },
    );
  }

  Widget _buildExerciseItem(
    IstimaCompletionSectionController controller,
    int index,
    AudioExercise exercise,
    TextStyle textStyle,
    TextStyle questionStyle,
  ) {
    final isCompleted = controller.isExerciseCompleted(index);
    final isCorrect = controller.isAnswerCorrect(index);

    return ExerciseContainer(
      isCompleted: isCompleted,
      isCorrect: isCorrect,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Question number and audio button
          ExerciseHeader(
            onAudioTap: () => controller.playAudio(exercise.audioFile),
            isPlaying: controller.isPlaying.value,
            isCurrentFile:
                controller.currentPlayingFile.value == exercise.audioFile,
            exerciseIndex: index,
            questionStyle: questionStyle,
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

          // Completion exercise - show all options with appropriate styling
          ExerciseOptions(
            options: exercise.options,
            correctAnswerIndexes: exercise.correctAnswerIndexes,
            selectedAnswer: controller.selectedAnswers[index],
            isCompleted: isCompleted,
            isCorrect: isCorrect,
            onOptionTap: (optionIndex) =>
                controller.selectAnswer(index, optionIndex),
            textStyle: textStyle,
          ),
        ],
      ),
    );
  }
}

class IstimaCompletionSectionController extends GetxController {
  final List<AudioExercise> exercises;
  final String sectionId;

  late AudioPlayer _audioPlayer;
  RxBool isPlaying = false.obs;
  RxString currentPlayingFile = ''.obs;
  RxBool showResults = false.obs;

  List<int?> selectedAnswers = [];
  List<bool> completedExercises = [];

  IstimaCompletionSectionController(this.exercises, this.sectionId) {
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
    // Load saved answers from SharedPreferences
    final savedAnswers = SharedPreferencesService.getCompletionExerciseResults(
      sectionId,
    );
    if (savedAnswers.isNotEmpty) {
      showResults.value = true;
      for (int i = 0; i < exercises.length; i++) {
        if (savedAnswers.containsKey(i)) {
          selectedAnswers[i] = savedAnswers[i];
          completedExercises[i] = true;
        }
      }
    } else {
      // Fallback to old method for backward compatibility
      for (int i = 0; i < exercises.length; i++) {
        final exerciseId = '${sectionId}_exercise_$i';
        completedExercises[i] =
            SharedPreferencesService.isIstimaExerciseCompleted(exerciseId);
        if (completedExercises[i]) {
          selectedAnswers[i] = exercises[i].correctAnswerIndexes.first;
        }
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
          AssetSource(
            'materials/istima/audio/${_getChapterFolder()}/$audioFile',
          ),
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
    if (completedExercises[exerciseIndex] || showResults.value) return;

    selectedAnswers[exerciseIndex] = answerIndex;

    // Don't auto-complete exercises anymore - wait for "Check All Answers"
    update();
  }

  void checkAllAnswers() {
    showResults.value = true;

    // Prepare all answers for saving
    Map<int, int> allAnswers = {};

    for (int i = 0; i < exercises.length; i++) {
      final selectedAnswer = selectedAnswers[i];
      if (selectedAnswer != null) {
        allAnswers[i] = selectedAnswer;
        completedExercises[i] = true;
      }
    }

    // Save all answers (both correct and incorrect) to SharedPreferences
    SharedPreferencesService.saveCompletionExerciseResults(
      sectionId,
      allAnswers,
    );

    update();
  }

  bool canCheckAnswers() {
    // Enable button only if ALL exercises have an answer selected AND not showing results
    if (showResults.value) return false;

    for (int i = 0; i < exercises.length; i++) {
      if (selectedAnswers[i] == null) {
        return false;
      }
    }
    return true;
  }

  int getCorrectAnswersCount() {
    int count = 0;
    for (int i = 0; i < exercises.length; i++) {
      if (selectedAnswers[i] != null &&
          exercises[i].correctAnswerIndexes.contains(selectedAnswers[i])) {
        count++;
      }
    }
    return count;
  }

  bool isExerciseCompleted(int index) {
    return completedExercises[index];
  }

  bool isAnswerCorrect(int index) {
    if (selectedAnswers[index] == null) return false;
    return exercises[index].correctAnswerIndexes.contains(
      selectedAnswers[index],
    );
  }

  String _getChapterFolder() {
    // Get chapter from route arguments
    final Map<String, dynamic>? args = Get.arguments;
    final Chapter? chapter = args?['chapter'] as Chapter?;

    // Use the chapter enum to get the correct folder name
    final activeChapter = chapter ?? Chapter.bab1;
    return 'bab ${activeChapter.id}';
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}
