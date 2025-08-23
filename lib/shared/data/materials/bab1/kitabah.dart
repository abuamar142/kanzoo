import '../../../models/base/scramble_section.dart';
import '../../../models/simple_material_content.dart';
import '../../../models/templates/section_one.dart';
import '../../../models/templates/section_two.dart';

SimpleMaterialContent get kitabahBab1Content => SimpleMaterialContent([
  SectionTwo(
    'Tugas Individu',
    'Urutkan kalimat dimulai dari kata yang bergaris bawah (kata depan)!',
    [
      ScrambleSentence(
        correctOrder: [
          'مَنْ',
          'هَذِهِ',
          '؟',
          'هِيَ',
          'لَطِيفَة',
          '،',
          'هَذِهِ',
          'صَدِيقَتِي',
          'هِيَ',
          'طَالِبَة',
        ],
      ),
      ScrambleSentence(
        correctOrder: ['أَنَا', 'اسْمِي', 'شَفِيقٍ', '،', 'أَنَا', 'طَالِب'],
      ),
      ScrambleSentence(
        correctOrder: [
          'أَنْتَ',
          'مَحْمُود',
          'يَا',
          'صَدِيقِي',
          '،',
          'وَ',
          'أَنْتَ',
          'فَوْزَان',
          'يَا',
          'صَدِيقِي',
        ],
      ),
      ScrambleSentence(
        correctOrder: [
          'مَنْ',
          'هذا',
          '؟',
          'هُوَ',
          'مَرْزُوقِى',
          '،',
          'هَذَا',
          'صَدِيقِي',
          'هُوَ',
          'طَالِب',
        ],
      ),
      ScrambleSentence(
        correctOrder: [
          'أَنْتِ',
          'رَفِيدَة',
          'يَا',
          'صَدِيقَتِي',
          '،',
          'وَأَنْتِ',
          'قَانِتَة',
          'يَا',
          'صَدِيقَتِي',
        ],
      ),
    ],
    'bab1_kitabah_scramble',
  ),
  SectionOne('Tugas Kelompok', [
    '1) Buatlah 3 kalimat yang mengandung kata Ganti (ضَمِيْرٌ) dan kata tunjuk (اِسْمُ الإِشَارَة)!',
    '2) Kerjakan di buku tulis bersama temanmu!',
    '3) Kumpulkan kepada guru untuk dinilai!',
  ]),
]);
