import 'package:flutter/material.dart';

import '../base/material_section.dart';
import '../base/paragraph_section.dart';
import '../base/title_section.dart';

class SectionOne extends MaterialSection {
  final String title;
  final List<ParagraphSection> paragraphs;

  const SectionOne(this.title, this.paragraphs);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSection(title).build(context),
        ...paragraphs.map((paragraph) {
          return paragraph.build(context);
        }),
      ],
    );
  }
}
