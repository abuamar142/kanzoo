import 'package:flutter/material.dart';

import '../../enum/exercise.dart';
import '../base/audio_exercise.dart';
import '../base/completion_section.dart';
import '../base/matching_section.dart';
import '../base/material_section.dart';
import '../base/title_section.dart';

class SectionFour extends MaterialSection {
  final String title;
  final List<AudioExercise> exercises;
  final String sectionId;
  final Exercise exerciseType;

  const SectionFour(
    this.title,
    this.exercises,
    this.sectionId,
    this.exerciseType,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSection(title).build(context),
        () {
          switch (exerciseType) {
            case Exercise.matching:
              return MatchingSection(
                exercises: exercises,
                sectionId: sectionId,
              ).build(context);
            case Exercise.completion:
              return CompletionSection(
                exercises: exercises,
                sectionId: sectionId,
              ).build(context);
            case Exercise.scramble:
              return Container();
          }
        }(),
      ],
    );
  }
}
