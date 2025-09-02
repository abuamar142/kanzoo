import 'package:flutter/material.dart';

import '../../../core/utils/section_id_generator.dart';
import '../../enum/chapter.dart';
import '../../enum/kind.dart';
import '../base/material_section.dart';
import '../base/multiple_choice_section.dart';
import '../base/subtitle_section.dart';
import '../base/title_section.dart';

class SectionSix extends MaterialSection {
  final String title;
  final String subtitle;
  final List<MultipleChoiceQuestion> questions;
  final Chapter chapter;
  final Kind kind;

  const SectionSix({
    required this.title,
    required this.subtitle,
    required this.questions,
    required this.chapter,
    required this.kind,
  });

  @override
  Widget build(BuildContext context) {
    final sectionId = SectionIdGenerator.generateSectionId(chapter, kind);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSection(title).build(context),
        SubtitleSection(subtitle).build(context),
        MultipleChoiceSection(
          questions: questions,
          sectionId: '${sectionId}_multiple_choice',
        ).build(context),
      ],
    );
  }
}
