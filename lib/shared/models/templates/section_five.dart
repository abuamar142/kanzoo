import 'package:flutter/material.dart';

import '../base/material_section.dart';
import '../base/paragraph_section.dart';
import '../base/subtitle_section.dart';
import '../base/title_section.dart';

class SectionFive extends MaterialSection {
  final String title;
  final String instruction;
  final List<String> paragraphs;

  const SectionFive(this.title, this.instruction, this.paragraphs);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSection(title).build(context),
        SubtitleSection(instruction, enablePadding: false).build(context),
        ParagraphSection(paragraphs).build(context),
      ],
    );
  }
}
