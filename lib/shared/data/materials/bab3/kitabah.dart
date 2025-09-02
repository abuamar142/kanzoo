import '../../../models/base/material_section.dart';
import '../../../models/base/paragraph_section.dart';
import '../../../models/base/subtitle_section.dart';
import '../../../models/base/title_section.dart';
import '../../../models/material_content.dart';

class Bab3KitabahData {
  static final List<MaterialSection> sections = [
    TitleSection('Tugas Individu'),
    SubtitleSection(
      'Berilah harakat pada kalimat berikut dan tentukan dhamir muttashil yang tepat!',
    ),
    ParagraphSection([
      '١. ما اسمـ ____ يا أخي ؟ اسمي محمد .',
      '٢. هذا أخي ، اسمـ ____ إبراهيم',
      '٣. هذه أختي ، اسمـ ____ فاطمة',
      '٤. أنا طالبة ، اسمـ ____ فائزة .',
      '٥. تلك موظفة ، اسمـ ____ سلمى',
    ], isArabicParagraph: true),
    TitleSection('Tugas Kelompok'),
    ParagraphSection([
      '1) Buatlah 3 kalimat yang mengandung kosakata tentang warna!',
      '2) Kerjakan di buku tulis bersama temanmu!',
      '3) Kumpulkan kepada guru untuk dinilai!',
    ]),
  ];
}

MaterialContent get kitabahBab3Content =>
    MaterialContent(Bab3KitabahData.sections);
