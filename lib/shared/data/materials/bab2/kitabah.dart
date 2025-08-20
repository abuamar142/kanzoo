import '../../../models/material_content.dart';

class Bab2KitabahData {
  static final MaterialContent content = MaterialContent(
    topicId: 'kitabah_bab2',
    kind: 'kitabah',
    chapter: 2,
    sections: [
      MaterialSection(
        title: 'Tugas Individu',
        type: MaterialSectionType.four,
        subtitle:
            'Urutkan kalimat dimulai dari kata yang bergaris bawah (kata depan)!',
        scrambleItems: [
          // Underline the preposition token when present
          MaterialScrambleItem(
            tokens: [
              'الْكَبِير',
              'أَمَامَ',
              'كَبِيرَة',
              'هِيَ',
              'الْمَدْرَسَة',
              'الْمَسْجِد',
            ],
            underlineIndex: 4,
          ),
          MaterialScrambleItem(
            tokens: [
              'في',
              'كَبِيرَة',
              'عَلَى',
              'فَصْلِى',
              'السَبُّوْرَة',
              'هي',
              'الحَائِط',
            ],
            underlineIndex: 4,
          ),
          MaterialScrambleItem(
            tokens: [
              'المَخْزَنِ',
              'بَيْنَ',
              'مُنَظَّم',
              'و',
              'الْمُصَلَّى',
              'فَصْلِي',
              'هو',
            ],
            underlineIndex: 5,
          ),
          MaterialScrambleItem(
            tokens: [
              'هَذَا',
              'وَرَاءَ',
              'مَلْعَب',
              'هُوَ',
              'الْمَدْرَسَة',
              'وَاسِع',
            ],
            underlineIndex: 0,
          ),
          MaterialScrambleItem(
            tokens: [
              'المَدْرَسَة',
              'و',
              'مَكْتَبَة',
              'هِيَ',
              'وَاسِعَة',
              'المُصَلَّى',
              'نَظِيفَة',
              'وَرَاءَ',
            ],
            underlineIndex: 2,
          ),
        ],
      ),
      MaterialSection(
        title: 'Tugas Kelompok',
        type: MaterialSectionType.five,
        subtitle: 'Kerjakan tugas berikut:',
        groupQuestions: [
          MaterialGroupQuestion(
            question:
                'Buatlah 5 kalimat sederhana dengan kata keterangan tempat (ظَرْفُ المَكَان) berikut!',
            subItems: ['وَرَاءَ', 'بَيْنَ', 'أَمَامَ', 'جَانِبَ', 'تَحْتَ'],
          ),
          MaterialGroupQuestion(
            question: 'Kerjakan di buku tulis bersama temanmu!',
          ),
          MaterialGroupQuestion(
            question: 'Kumpulkan kepada guru untuk dinilai!',
          ),
        ],
      ),
    ],
  );
}
