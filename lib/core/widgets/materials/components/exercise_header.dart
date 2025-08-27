import 'package:flutter/material.dart';

import '../../../theme/app_dimensions.dart';
import 'audio_play_button.dart';
import 'question_number.dart';

class ExerciseHeader extends StatelessWidget {
  final VoidCallback onAudioTap;
  final bool isPlaying;
  final bool isCurrentFile;
  final int exerciseIndex;
  final TextStyle questionStyle;
  final Widget? extraWidget; // For multiple answer indicator

  const ExerciseHeader({
    super.key,
    required this.onAudioTap,
    required this.isPlaying,
    required this.isCurrentFile,
    required this.exerciseIndex,
    required this.questionStyle,
    this.extraWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Audio play button
        AudioPlayButton(
          onTap: onAudioTap,
          isPlaying: isPlaying,
          isCurrentFile: isCurrentFile,
        ),

        // Right side with optional extra widget and question number
        Row(
          children: [
            if (extraWidget != null) ...[
              extraWidget!,
              const SizedBox(width: AppDimensions.spaceM),
            ],
            // Question number
            QuestionNumber(index: exerciseIndex, questionStyle: questionStyle),
          ],
        ),
      ],
    );
  }
}
