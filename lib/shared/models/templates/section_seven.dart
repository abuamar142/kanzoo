import 'package:flutter/material.dart';

import '../../../core/utils/section_id_generator.dart';
import '../../enum/chapter.dart';
import '../../enum/kind.dart';
import '../base/dragable_matching_section.dart';
import '../base/matching_question_section.dart';
import '../base/material_section.dart';
import '../base/subtitle_section.dart';
import '../base/title_section.dart';

class SectionSeven extends MaterialSection {
  final String title;
  final String subtitle;
  final String leftColumnTitle;
  final String rightColumnTitle;
  final List<MatchingPair> pairs;
  final Chapter chapter;
  final Kind kind;

  const SectionSeven({
    required this.title,
    required this.subtitle,
    required this.leftColumnTitle,
    required this.rightColumnTitle,
    required this.pairs,
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
        DragableMatchingSection(
          title: '',
          leftColumnTitle: leftColumnTitle,
          rightColumnTitle: rightColumnTitle,
          pairs: pairs,
          sectionId: '${sectionId}_dragable_matching',
        ).build(context),
      ],
    );
  }
}
