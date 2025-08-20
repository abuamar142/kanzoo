import '../../../models/material_content.dart';

class Bab1KitabahData {
  static final MaterialContent content = MaterialContent(
    topicId: 'kitabah_bab1',
    kind: 'kitabah',
    chapter: 1,
    sections: [
      MaterialSection(
        title: 'Tugas Individu',
        type: MaterialSectionType.four,
        subtitle:
            'Urutkan kalimat dimulai dari kata yang bergaris bawah (kata depan)!',
        scrambleItems: [
          MaterialScrambleItem(
            tokens: [
              'لَطِيفَة',
              'مَنْ',
              'هَذِهِ',
              'هِيَ',
              'هذِهِ',
              'صَدِيقَتِي',
              'طَالِبَة',
              'هِيَ',
              '؟',
            ],
            underlineIndex: 1,
          ),
          MaterialScrambleItem(
            tokens: ['اسْمِي', 'أَنَا', 'طَالِب', 'شَفِيقٍ'],
            underlineIndex: 1,
          ),
          MaterialScrambleItem(
            tokens: [
              'يَا',
              'صَدِيقِي',
              'مَحْمُود',
              'أَنْتَ',
              'وَ',
              'أَنْتَ',
              'فَوْزَان',
              'يَا',
            ],
            underlineIndex: 3,
          ),
          MaterialScrambleItem(
            tokens: [
              'هُوَ',
              'هذا',
              'مَرْزُوقِى',
              'مَنْ',
              'طَالِب',
              'هُوَ',
              'صَدِيقِي',
              'هَذَا',
              '؟',
            ],
            underlineIndex: 3,
          ),
          MaterialScrambleItem(
            tokens: [
              'رَفِيدَة',
              'أَنْتِ',
              'يَا',
              'وَأَنْتِ',
              'صَدِيقَتِي',
              'يَا',
              'صَدِيقَتِي',
              'قَانِتَة',
            ],
            underlineIndex: 1,
          ),
        ],
      ),
      MaterialSection(
        title: 'Tugas Kelompok',
        type: MaterialSectionType.one,
        paragraphs: [
          '1) Buatlah 3 kalimat yang mengandung kata Ganti (ضَمِيْرٌ) dan kata tunjuk (اِسْمُ الإِشَارَة)!',
          '2) Kerjakan di buku tulis bersama temanmu!',
          '3) Kumpulkan kepada guru untuk dinilai!',
        ],
      ),
    ],
  );
}
