import '../../../../core/utils/section_id_generator.dart';
import '../../../enum/chapter.dart';
import '../../../enum/kind.dart';
import '../../../models/base/material_section.dart';
import '../../../models/base/paragraph_section.dart';
import '../../../models/base/scramble_section.dart';
import '../../../models/base/subtitle_section.dart';
import '../../../models/base/title_section.dart';
import '../../../models/simple_material_content.dart';

class Bab2KitabahData {
  static final List<MaterialSection> sections = [
    TitleSection('Tugas Individu'),
    SubtitleSection(
      'Urutkan kalimat dimulai dari kata yang bergaris bawah (kata depan)!',
    ),
    ScrambleSection(
      sentences: [
        ScrambleSentence(
          correctOrder: [
            'الْمَدْرَسَة',
            'الكَبِيرَة',
            'أَمَامَ',
            'الْمَسْجِد',
            'الْكَبِير',
          ],
        ),
        ScrambleSentence(
          correctOrder: ['السَبُّوْرَة', 'الكَبِيرَة', 'عَلَى', 'الحَائِط'],
        ),
        ScrambleSentence(
          correctOrder: [
            'القَاعَة',
            'الـمُنَظَّمَة',
            'تَقَعُ',
            'بَيْنَ',
            'الـمَخْزَنِ',
            'وَ',
            'الْمُصَلَّى',
          ],
        ),
        ScrambleSentence(
          correctOrder: [
            'هَذَا',
            'مَلْعَب',
            'وَاسِع',
            'هُوَ',
            'وَرَاءَ',
            'الْمَدْرَسَة',
          ],
        ),
        ScrambleSentence(
          correctOrder: ['مَكْتَبَة', 'وَاسِعَة', 'وَرَاءَ', 'الفَصْلِ'],
        ),
      ],
      sectionId: SectionIdGenerator.generateScrambleId(
        Chapter.bab2,
        Kind.kitabah,
      ),
    ),
    TitleSection('Tugas Kelompok'),
    ParagraphSection([
      '1) Buatlah 5 kalimat sederhana dengan kata keterangan tempat (ظَرْفُ المَكَان) berikut!',
    ]),
    ParagraphSection([
      '١. وَرَاءَ',
      '٢. بَيْنَ',
      '٣. أَمَامَ',
      '٤. جَانِبَ',
      '٥. تَحْتَ',
    ], isArabicParagraph: true),
    ParagraphSection([
      '2) Kerjakan di buku tulis bersama temanmu!',
      '3) Kumpulkan kepada guru untuk dinilai!',
    ]),
  ];
}

SimpleMaterialContent get kitabahBab2Content =>
    SimpleMaterialContent(Bab2KitabahData.sections);
