import '../../../models/base/paragraph_section.dart';
import '../../../models/simple_material_content.dart';
import '../../../models/templates/section_one.dart';

SimpleMaterialContent get kitabahBab3Content => SimpleMaterialContent([
  SectionOne('Tugas Individu', [
    ParagraphSection([
      'Berilah harakat pada kalimat berikut dan tentukan dhamir muttashil yang tepat!',
    ]),
    ParagraphSection([
      '١. ما اسمـ ____ يا أخي ؟ اسمي محمد .',
      '٢. هذا أخي ، اسمـ ____ إبراهيم',
      '٣. هذه أختي ، اسمـ ____ فاطمة',
      '٤. أنا طالبة ، اسمـ ____ فائزة .',
      '٥. تلك موظفة ، اسمـ ____ سلمى',
    ], isArabicParagraph: true),
  ]),
  SectionOne('Tugas Kelompok', [
    ParagraphSection([
      '1) Buatlah 3 kalimat yang mengandung kosakata tentang warna!',
      '2) Kerjakan di buku tulis bersama temanmu!',
      '3) Kumpulkan kepada guru untuk dinilai!',
    ]),
  ]),
]);
