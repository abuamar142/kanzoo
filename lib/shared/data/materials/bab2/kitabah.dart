import '../../../models/base/scramble_section.dart';
import '../../../models/simple_material_content.dart';
import '../../../models/templates/section_one.dart';
import '../../../models/templates/section_two.dart';

SimpleMaterialContent get kitabahBab2Content => SimpleMaterialContent([
  SectionTwo(
    'Tugas Individu',
    'Urutkan kalimat dimulai dari kata yang bergaris bawah (kata depan)!',
    [
      ScrambleSentence(
        correctOrder: [
          'أَمَامَ',
          'الْمَدْرَسَة',
          'الْمَسْجِد',
          'الْكَبِير',
          '،',
          'هِيَ',
          'كَبِيرَة',
        ],
      ),
      ScrambleSentence(
        correctOrder: [
          'في',
          'فَصْلِى',
          'السَبُّوْرَة',
          'كَبِيرَة',
          '،',
          'هي',
          'عَلَى',
          'الحَائِط',
        ],
      ),
      ScrambleSentence(
        correctOrder: [
          'فَصْلِي',
          'بَيْنَ',
          'المَخْزَنِ',
          'و',
          'الْمُصَلَّى',
          '،',
          'هو',
          'مُنَظَّم',
        ],
      ),
      ScrambleSentence(
        correctOrder: [
          'وَرَاءَ',
          'الْمَدْرَسَة',
          'مَلْعَب',
          '،',
          'هَذَا',
          'هُوَ',
          'وَاسِع',
        ],
      ),
      ScrambleSentence(
        correctOrder: [
          'وَرَاءَ',
          'المُصَلَّى',
          'مَكْتَبَة',
          '،',
          'هِيَ',
          'وَاسِعَة',
          'و',
          'نَظِيفَة',
        ],
      ),
    ],
    'bab2_kitabah_scramble',
  ),
  SectionOne('Tugas Kelompok', [
    'Buatlah 5 kalimat sederhana dengan kata keterangan tempat (ظَرْفُ المَكَان) berikut!',
    'وَرَاءَ، بَيْنَ، أَمَامَ، جَانِبَ، تَحْتَ',
    'Kerjakan di buku tulis bersama temanmu!',
    'Kumpulkan kepada guru untuk dinilai!',
  ]),
]);
