import '../../../enum/chapter.dart';
import '../../../enum/kind.dart';
import '../../../models/base/matching_question_section.dart';
import '../../../models/base/material_section.dart';
import '../../../models/base/multiple_choice_section.dart';
import '../../../models/material_content.dart';
import '../../../models/templates/section_five.dart';
import '../../../models/templates/section_seven.dart';
import '../../../models/templates/section_six.dart';

class Bab3SumatifData {
  static final List<MaterialSection> sections = [
    SectionSix(
      title: 'A. Pilihan Ganda (15 soal)',
      subtitle: 'Pilihlah jawaban yang paling tepat!',
      chapter: Chapter.bab3,
      kind: Kind.sumatif,
      questions: [
        const MultipleChoiceQuestion(
          question: '"لَوْنُ السَّاعَةِ أَسْوَدُ" artinya …',
          options: [
            'Jam itu berwarna hitam',
            'Jam itu berwarna putih',
            'Jam itu berwarna merah',
            'Jam itu berwarna hijau',
          ],
          correctAnswerIndex: 0,
        ),
        const MultipleChoiceQuestion(
          question: 'Kata ganti sambung untuk "bukuku" adalah …',
          options: ['كَـ', 'هُـ', 'ـي', 'هَا'],
          correctAnswerIndex: 2,
        ),
        const MultipleChoiceQuestion(
          question:
              'Pasangan yang benar antara mudzakkar dan muannats adalah …',
          options: [
            'أَحْمَر – حَمْرَاء',
            'أَبْيَض – زَرْقَاء',
            'أَصْفَر – بَيْضَاء',
            'أَسْوَد – حَمْرَاء',
          ],
          correctAnswerIndex: 0,
        ),
        const MultipleChoiceQuestion(
          question:
              'Dalam kalimat "الْكِتَابُ أَحْمَرُ", posisi "أَحْمَرُ" adalah …',
          options: ['Mubtada\'', 'Khabar', 'Na\'at', 'Dhamīr'],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question:
              'Jika ditanya "مَا لَوْنُ الْمِسْطَرَةِ؟", jawaban yang tepat …',
          options: [
            'لَوْنُهَا أَحْمَرُ',
            'لَوْنُهَا بَيْضَاءُ',
            'لَوْنُهَا رَمَادِيٌّ',
            'Sesuai konteks',
          ],
          correctAnswerIndex: 3,
        ),
        const MultipleChoiceQuestion(
          question: 'Lawan kata "أَسْوَدُ" menurut daftar warna adalah …',
          options: ['بَيْضَاءُ', 'أَحْمَرُ', 'بُنِّيٌّ', 'أَخْضَرُ'],
          correctAnswerIndex: 0,
        ),
        const MultipleChoiceQuestion(
          question:
              'Dalam kalimat "الْوَرْدَةُ حَمْرَاءُ", kata "حَمْرَاءُ" adalah …',
          options: ['Na\'at', 'Khabar', 'Mubtada\'', 'Dhamīr'],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question: 'Lengkapi: "الْقَلَمُ … (coklat)"',
          options: ['أَحْمَرُ', 'بُنِّيٌّ', 'أَزْرَقُ', 'بَيْضَاءُ'],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question: 'Kata ganti sambung untuk "rumahmu" (lk) adalah …',
          options: ['ـكَ', 'ـكِ', 'ـي', 'ـهُ'],
          correctAnswerIndex: 0,
        ),
        const MultipleChoiceQuestion(
          question: 'Pilih kalimat yang benar menggunakan dhamīr muttaṣil!',
          options: [
            'كِتَابُكَ جَمِيلٌ',
            'كِتَابُهَا جَمِيلٌ',
            'كِتَابِي جَمِيلٌ',
            'Semua benar',
          ],
          correctAnswerIndex: 3,
        ),
        const MultipleChoiceQuestion(
          question:
              'Jika ditanya: "مَا لَوْنُ الْقَلَمِ؟", jawaban yang tepat …',
          options: [
            'لَوْنُهُ بُنِّيٌّ',
            'لَوْنُهُ أَزْرَقُ',
            'لَوْنُهُ أَحْمَرُ',
            'Semua benar (tergantung konteks)',
          ],
          correctAnswerIndex: 3,
        ),
        const MultipleChoiceQuestion(
          question:
              'Perhatikan: "لَوْنُ الْوَرْدَةِ أَحْمَرُ". Man\'utnya adalah …',
          options: ['أَحْمَرُ', 'الْوَرْدَةُ', 'لَوْنُ', 'جَمِيل'],
          correctAnswerIndex: 2,
        ),
        const MultipleChoiceQuestion(
          question:
              'Dalam kalimat "الْقَلَمُ بُنِّيٌّ", kata "بُنِّيٌّ" berfungsi sebagai …',
          options: ['Mubtada\'', 'Khabar', 'Na\'at', 'Maf\'ul'],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question: 'Pilih pasangan yang tidak sesuai:',
          options: [
            'كِتَابٌ أَزْرَقُ',
            'مِسْطَرَةٌ خَضْرَاءُ',
            'حَقِيبَةٌ سَوْدَاءُ',
            'وَرْدَةٌ بَيْضَاءُ',
          ],
          correctAnswerIndex: 3,
        ),
        const MultipleChoiceQuestion(
          question:
              '"لَوْنُ الْكِتَابِ أَحْمَرُ" → kata "أَحْمَرُ" berhubungan dengan …',
          options: [
            'لَوْنُ sebagai mubtada\'',
            'الْكِتَاب sebagai man\'ut',
            'دَمِير sebagai fa\'il',
            'الصُّورَة sebagai maf\'ul',
          ],
          correctAnswerIndex: 0,
        ),
      ],
    ),

    SectionSeven(
      title: 'B. Mencocokkan (5 soal)',
      subtitle: 'Cocokkan kolom A dengan kolom B!',
      leftColumnTitle: 'Kolom A',
      rightColumnTitle: 'Kolom B',
      chapter: Chapter.bab3,
      kind: Kind.sumatif,
      pairs: [
        const MatchingPair(left: 'كِتَابِي', right: 'Bukuku'),
        const MatchingPair(left: 'كِتَابُكَ', right: 'Bukumu (lk)'),
        const MatchingPair(left: 'كِتَابُهُ', right: 'Bukunya (lk)'),
        const MatchingPair(left: 'كِتَابُهَا', right: 'Bukunya (pr)'),
        const MatchingPair(left: 'كِتَابُنَا', right: 'Buku kita'),
      ],
    ),

    const SectionFive(
      'C. Isian Singkat (5 soal)',
      'Jawablah pertanyaan-pertanyaan berikut di buku tugas Anda!',
      [
        '1. Tulislah kalimat dengan kata "وَرْدَةٌ" dan warna merah!',
        '2. Apa lawan kata dari "أَحْمَرُ" dalam daftar warna?',
        '3. Lengkapilah: "لَوْنُ الْـمِسْطَرَةِ …" (hijau).',
        '4. Sebutkan 3 contoh dhamīr muttaṣil!',
        '5. Jawablah dengan bahasa Arab: "مَا لَوْنُ حَقِيبَتِكَ؟"',
      ],
    ),
  ];
}

MaterialContent get sumatifBab3Content =>
    MaterialContent(Bab3SumatifData.sections);
