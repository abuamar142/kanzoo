import 'package:flutter/material.dart';

import '../base/material_section.dart';
import '../base/scramble_section.dart';
import '../base/subtitle_section.dart';
import '../base/title_section.dart';

class SectionTwo extends MaterialSection {
  final String title;
  final String instruction;
  final List<ScrambleSentence> scrambleSentences;
  final String sectionId;

  const SectionTwo(
    this.title,
    this.instruction,
    this.scrambleSentences,
    this.sectionId,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSection(title).build(context),
        SubtitleSection(instruction).build(context),
        ScrambleSection(
          sentences: scrambleSentences,
          sectionId: sectionId,
        ).build(context),
      ],
    );
  }
}
