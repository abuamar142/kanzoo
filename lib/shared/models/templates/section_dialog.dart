import 'package:flutter/material.dart';

import '../base/dialog_line.dart';
import '../base/dialog_section.dart';
import '../base/material_section.dart';
import '../base/subtitle_section.dart';
import '../base/title_section.dart';

class SectionDialog extends MaterialSection {
  final String title;
  final String subtitle;
  final List<DialogLine> dialogLines;

  const SectionDialog(this.title, this.subtitle, this.dialogLines);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSection(title).build(context),
        SubtitleSection(subtitle).build(context),
        DialogSection(dialogLines).build(context),
      ],
    );
  }
}
