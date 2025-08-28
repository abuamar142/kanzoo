import '../../../enum/chapter.dart';
import '../../../enum/kind.dart';
import '../../../models/base/matching_question_section.dart';
import '../../../models/base/material_section.dart';
import '../../../models/base/multiple_choice_section.dart';
import '../../../models/simple_material_content.dart';
import '../../../models/templates/section_five.dart';
import '../../../models/templates/section_seven.dart';
import '../../../models/templates/section_six.dart';

class Bab2SumatifData {
  static final List<MaterialSection> sections = [
    SectionSix(
      title: 'A. Pilihan Ganda (15 soal)',
      subtitle: 'Pilihlah jawaban yang paling tepat!',
      chapter: Chapter.bab2,
      kind: Kind.sumatif,
      questions: [
        const MultipleChoiceQuestion(
          question: 'فِي أَيِّ طَابِقٍ وَقَعَتِ الْمَكْتَبَةُ؟',
          options: [
            'الطَّابِقِ الْأَوَّلِ',
            'الطَّابِقِ الثَّانِي',
            'الطَّابِقِ الثَّالِثِ',
            'الطَّابِقِ الْأَرْبَعِ',
          ],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question:
              'كَمْ غُرْفَةً ذُكِرَتْ فِي الْقِصَّةِ (غُرْفَةُ الرَّئِيسِ، غُرْفَةُ الْمُدَرِّسِينَ، غُرْفَةُ الصِّحَّةِ، غُرْفَةُ الدَّارِيَّةِ)؟',
          options: ['اِثْنَتَانِ', 'ثَلَاثٌ', 'أَرْبَعٌ', 'خَمْسٌ'],
          correctAnswerIndex: 2,
        ),
        const MultipleChoiceQuestion(
          question: 'الْكَلِمَةُ "نَظِيف" هِيَ …',
          options: ['نَعْتٌ', 'مَنْعُوتٌ', 'ضَمِيرٌ', 'اِسْمُ إِشَارَةٍ'],
          correctAnswerIndex: 0,
        ),
        const MultipleChoiceQuestion(
          question: 'ظَرْفُ الْمَكَانِ "تَحْتَ" artinya …',
          options: ['Di atas', 'Di dalam', 'Di bawah', 'Di depan'],
          correctAnswerIndex: 2,
        ),
        const MultipleChoiceQuestion(
          question: 'جُمْلَةُ "هٰذِهِ قَاعَةٌ وَاسِعَةٌ" نَعْتُهَا هُوَ …',
          options: ['هٰذِهِ', 'قَاعَةٌ', 'وَاسِعَةٌ', 'جَدِيدَةٌ'],
          correctAnswerIndex: 2,
        ),
        const MultipleChoiceQuestion(
          question: '"الْمَكْتَبَةُ جَانِبَ الْمَعْمَلِ" artinya …',
          options: [
            'Perpustakaan di depan laboratorium',
            'Perpustakaan di samping laboratorium',
            'Perpustakaan di belakang laboratorium',
            'Perpustakaan di atas laboratorium',
          ],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question:
              'Kata tanya yang tepat untuk menanyakan asal seseorang adalah …',
          options: ['أَيْنَ', 'إِلَى أَيْنَ', 'مَنْ', 'مِنْ أَيْنَ'],
          correctAnswerIndex: 3,
        ),
        const MultipleChoiceQuestion(
          question: 'Lawan kata dari "وَاسِعٌ" adalah …',
          options: ['قَصِيرٌ', 'قَدِيمٌ', 'ضَيِّقٌ', 'جَدِيدٌ'],
          correctAnswerIndex: 2,
        ),
        const MultipleChoiceQuestion(
          question: 'Pilih kalimat yang benar sesuai aturan Na\'at-Man\'ut!',
          options: [
            'طَالِبٌ نَشِيطٌ إِبْرَاهِيمُ',
            'إِبْرَاهِيمُ طَالِبٌ نَشِيطٌ',
            'نَشِيطٌ إِبْرَاهِيمُ طَالِبٌ',
            'طَالِبٌ إِبْرَاهِيمُ نَشِيطٌ',
          ],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question: 'Jika ditanya "أَيْنَ الْمَسْجِدُ؟" jawaban yang benar …',
          options: [
            'الْمَسْجِدُ أَمَامَ الْفَصْلِ',
            'الْمَسْجِدُ جَانِبَ الْمَلْعَبِ',
            'الْمَسْجِدُ تَحْتَ الْمَعْمَلِ',
            'Semua benar (tergantung teks)',
          ],
          correctAnswerIndex: 3,
        ),
        const MultipleChoiceQuestion(
          question:
              'Lengkapi: "الْمَلْعَبُ … الْمَدْرَسَةِ" (di belakang sekolah).',
          options: ['فَوْقَ', 'أَمَامَ', 'وَرَاءَ', 'بَيْنَ'],
          correctAnswerIndex: 2,
        ),
        const MultipleChoiceQuestion(
          question:
              'Jika "الْمَكْتَبَةُ نَظِيفَةٌ", maka "الْمَكْتَبَةُ" adalah …',
          options: ['نَعْتٌ', 'مَنْعُوتٌ', 'مُبْتَدَأٌ', 'خَبَرٌ'],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question:
              'Perhatikan kalimat: "هٰذَا مَقْصَفٌ نَظِيفٌ". Man\'utnya adalah …',
          options: ['هٰذَا', 'مَقْصَفٌ', 'نَظِيفٌ', 'هُوَ'],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question:
              'Dalam kalimat "فِي الْمَدْرَسَةِ مَعْمَلَانِ", fungsi "فِي الْمَدْرَسَةِ" adalah …',
          options: ['مُبْتَدَأٌ', 'خَبَرٌ', 'ظَرْفُ مَكَانٍ', 'نَعْتٌ'],
          correctAnswerIndex: 2,
        ),
        const MultipleChoiceQuestion(
          question:
              'Pilih pasangan yang tidak sesuai antara Na\'at dan Man\'ut:',
          options: [
            'طَالِبٌ نَشِيطٌ',
            'طَالِبَةٌ نَشِيطَةٌ',
            'كِتَابٌ جَمِيلَةٌ',
            'بَيْتٌ كَبِيرٌ',
          ],
          correctAnswerIndex: 2,
        ),
      ],
    ),

    SectionSeven(
      title: 'B. Mencocokkan (5 soal)',
      subtitle: 'Cocokkan kolom A dengan kolom B!',
      leftColumnTitle: 'Kolom A',
      rightColumnTitle: 'Kolom B',
      chapter: Chapter.bab2,
      kind: Kind.sumatif,
      pairs: [
        const MatchingPair(left: 'أَيْنَ', right: 'Di mana'),
        const MatchingPair(left: 'مِنْ أَيْنَ', right: 'Dari mana'),
        const MatchingPair(left: 'إِلَى أَيْنَ', right: 'Ke mana'),
        const MatchingPair(left: 'جَانِبَ', right: 'Di samping'),
        const MatchingPair(left: 'وَرَاءَ', right: 'Di belakang'),
      ],
    ),

    const SectionFive(
      'C. Isian Singkat (5 soal)',
      'Jawablah pertanyaan-pertanyaan berikut di buku tugas Anda!',
      [
        '1. Lengkapilah: "هٰذَا فَصْلٌ … (besar)" → …',
        '2. Apa lawan kata dari "قَصِيرٌ" dalam teks?',
        '3. Buatlah kalimat dengan kata "أَمَامَ".',
        '4. Sebutkan 2 contoh Na\'at dari daftar sifat di Bab 2!',
        '5. Jawablah pertanyaan: "مِنْ أَيْنَ أَنْتَ؟" (jawaban bebas dengan benar).',
      ],
    ),
  ];
}

SimpleMaterialContent get sumatifBab2Content =>
    SimpleMaterialContent(Bab2SumatifData.sections);
