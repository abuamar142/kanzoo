import 'package:flutter/material.dart';

import '../base/material_section.dart';
import '../base/table_section.dart';
import '../base/title_section.dart';

class SectionThree extends MaterialSection {
  final String title;
  final List<List<String>> wordPairs;

  const SectionThree({required this.title, required this.wordPairs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSection(title).build(context),
        TableSection(
          headers: ['Bahasa Indonesia', 'العربية'],
          rows: wordPairs,
        ).build(context),
      ],
    );
  }
}
