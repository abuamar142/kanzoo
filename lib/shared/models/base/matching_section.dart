import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/services/shared_preferences_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/app_snackbar.dart';
import '../../../core/widgets/materials/components/check_all_answers_button.dart';
import '../../../core/widgets/materials/components/exercise_container.dart';
import '../../../core/widgets/materials/components/exercise_header.dart';
import '../../../core/widgets/materials/components/exercise_options.dart';
import '../../../core/widgets/materials/components/multiple_answer_indicator.dart';
import '../../../features/materials/presentation/controllers/font_size_controller.dart';
import '../../enum/chapter.dart';
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppConstants.listenAndMatchInstruction,
                              style: scaledTextStyle.copyWith(
                                color: AppColors.info,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            // Show additional instruction for multiple answer exercises
                            if (exercises.any(
                              (ex) => ex.requiresMultipleAnswers,
                            )) ...[
                              const SizedBox(height: AppDimensions.spaceXS),
                              Text(
                                'Catatan: Beberapa soal memerlukan lebih dari satu jawaban.',
                                style: scaledTextStyle.copyWith(
                                  color: AppColors.info,
                                  fontStyle: FontStyle.italic,
                                  fontSize: scaledTextStyle.fontSize! * 0.9,
                                ),
                              ),
                            ],
                          ],
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
    IstimaMatchingSectionController controller,
    int index,
    AudioExercise exercise,
    TextStyle textStyle,
    TextStyle questionStyle,
  ) {
    final isCompleted = controller.isExerciseCompleted(index);
    final selectedAnswers = controller.selectedAnswers[index];
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
            extraWidget: exercise.requiresMultipleAnswers
                ? MultipleAnswerIndicator(textStyle: textStyle)
                : null,
          ),

          SizedBox(height: AppDimensions.spaceS),

          // Matching options
          ExerciseOptions(
            options: exercise.options,
            correctAnswerIndexes: exercise.correctAnswerIndexes,
            selectedAnswers: selectedAnswers,
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

class IstimaMatchingSectionController extends GetxController {
  final List<AudioExercise> exercises;
  final String sectionId;

  late AudioPlayer _audioPlayer;
  RxBool isPlaying = false.obs;
  RxString currentPlayingFile = ''.obs;
  RxBool showResults = false.obs;

  List<List<int>> selectedAnswers = [];
  List<bool> completedExercises = [];

  IstimaMatchingSectionController(this.exercises, this.sectionId) {
    _audioPlayer = AudioPlayer();
    selectedAnswers = List.generate(exercises.length, (index) => <int>[]);
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
    final savedAnswers = SharedPreferencesService.getExerciseResults(sectionId);
    if (savedAnswers.isNotEmpty) {
      showResults.value = true;
      for (int i = 0; i < exercises.length; i++) {
        if (savedAnswers.containsKey(i)) {
          selectedAnswers[i] = List.from(savedAnswers[i]!);
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
          selectedAnswers[i] = List.from(exercises[i].correctAnswerIndexes);
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

    final exercise = exercises[exerciseIndex];
    final currentSelections = selectedAnswers[exerciseIndex];

    // Toggle selection
    if (currentSelections.contains(answerIndex)) {
      currentSelections.remove(answerIndex);
    } else {
      // For single answer exercises, clear previous selection
      if (!exercise.requiresMultipleAnswers) {
        currentSelections.clear();
      }
      currentSelections.add(answerIndex);
    }

    // Don't auto-complete exercises anymore - wait for "Check All Answers"
    update();
  }

  void checkAllAnswers() {
    showResults.value = true;

    // Save all current answers to SharedPreferences
    final answersToSave = <int, List<int>>{};
    for (int i = 0; i < exercises.length; i++) {
      if (selectedAnswers[i].isNotEmpty) {
        answersToSave[i] = List.from(selectedAnswers[i]);
        completedExercises[i] = true;

        // Also save individual exercise completion for backward compatibility
        final isCorrect = _isAnswerSetCorrect(i);
        if (isCorrect) {
          final exerciseId = '${sectionId}_exercise_$i';
          SharedPreferencesService.markIstimaExerciseCompleted(exerciseId);
        }
      }
    }

    // Save all answers (both correct and incorrect)
    SharedPreferencesService.saveExerciseResults(sectionId, answersToSave);

    update();
  }

  bool canCheckAnswers() {
    // Enable button only if ALL exercises have at least one selection AND not showing results
    if (showResults.value) return false;

    for (int i = 0; i < exercises.length; i++) {
      if (selectedAnswers[i].isEmpty) {
        return false;
      }
    }
    return true;
  }

  int getCorrectAnswersCount() {
    int count = 0;
    for (int i = 0; i < exercises.length; i++) {
      if (selectedAnswers[i].isNotEmpty && _isAnswerSetCorrect(i)) {
        count++;
      }
    }
    return count;
  }

  bool _isAnswerSetCorrect(int exerciseIndex) {
    final exercise = exercises[exerciseIndex];
    final currentSelections = selectedAnswers[exerciseIndex];

    if (currentSelections.length != exercise.correctAnswerIndexes.length) {
      return false;
    }

    for (int index in exercise.correctAnswerIndexes) {
      if (!currentSelections.contains(index)) {
        return false;
      }
    }

    return true;
  }

  bool isExerciseCompleted(int index) {
    return completedExercises[index];
  }

  bool isAnswerCorrect(int index) {
    if (selectedAnswers[index].isEmpty) return false;
    return _isAnswerSetCorrect(index);
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
