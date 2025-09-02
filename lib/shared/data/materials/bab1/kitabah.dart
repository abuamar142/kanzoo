import '../../../../core/utils/section_id_generator.dart';
import '../../../enum/chapter.dart';
import '../../../enum/kind.dart';
import '../../../models/base/material_section.dart';
import '../../../models/base/paragraph_section.dart';
import '../../../models/base/scramble_section.dart';
import '../../../models/base/subtitle_section.dart';
import '../../../models/base/title_section.dart';
import '../../../models/material_content.dart';

class Bab1KitabahData {
  static final List<MaterialSection> sections = [
    TitleSection('Tugas Individu'),
    SubtitleSection(
      'Urutkan kalimat dimulai dari kata yang bergaris bawah (kata depan)!',
    ),
    ScrambleSection(
      sentences: [
        ScrambleSentence(
          correctOrder: [
            'مَنْ',
            'هَذِهِ',
            '؟',
            'هَذِهِ',
            'لَطِيفَة',
            'هِيَ',
            'طَالِبَة',
          ],
        ),
        ScrambleSentence(
          correctOrder: ['اسْمِي', 'شَفِيقٍ', 'أَنَا', 'طَالِب'],
        ),
        ScrambleSentence(
          correctOrder: [
            'اسْمِي',
            'عَائِشَة',
            'وَ',
            'هُوَ',
            'صَدِيقِي',
            'اِسْمُهُ',
            'مَحْمُود',
          ],
        ),
        ScrambleSentence(
          correctOrder: [
            'مَنْ',
            'هُوَ',
            '؟',
            'هُوَ',
            'صَدِيقِي',
            'اِسْمُهُ',
            'مَرْزُوقِى',
          ],
        ),
        ScrambleSentence(
          correctOrder: ['أَنْتِ', 'صَدِيقَتِي', 'يَا', 'رَفِيدَة'],
        ),
      ],
      sectionId: SectionIdGenerator.generateScrambleId(
        Chapter.bab1,
        Kind.kitabah,
      ),
    ),
    TitleSection('Tugas Kelompok'),
    ParagraphSection([
      '1) Buatlah 3 kalimat yang mengandung kata Ganti (ضَمِيْرٌ) dan kata tunjuk (اِسْمُ الإِشَارَة)!',
      '2) Kerjakan di buku tulis bersama temanmu!',
      '3) Kumpulkan kepada guru untuk dinilai!',
    ]),
  ];
}

MaterialContent get kitabahBab1Content =>
    MaterialContent(Bab1KitabahData.sections);
