import '../../../enum/chapter.dart';
import '../../../enum/kind.dart';
import '../../../models/base/matching_question_section.dart';
import '../../../models/base/material_section.dart';
import '../../../models/base/multiple_choice_section.dart';
import '../../../models/simple_material_content.dart';
import '../../../models/templates/section_five.dart';
import '../../../models/templates/section_seven.dart';
import '../../../models/templates/section_six.dart';

class Bab1SumatifData {
  static final List<MaterialSection> sections = [
    SectionSix(
      title: 'A. Pilihan Ganda (15 soal)',
      subtitle: 'Pilihlah jawaban yang paling tepat!',
      chapter: Chapter.bab1,
      kind: Kind.sumatif,
      questions: [
        const MultipleChoiceQuestion(
          question: 'هُوَ صَالِحٌ، هُوَ …',
          options: ['مُدَرِّسٌ', 'طَالِبٌ', 'صَدِيقٌ', 'بَائِعٌ'],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question: 'مَنِ السَّيِّدُ عُمَرُ؟',
          options: ['مُوَظَّفٌ', 'نَاظِرُ المَدْرَسَةِ', 'بَائِعٌ', 'سَائِقٌ'],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question: 'تِلْكَ مُدَرِّسَةٌ، اسْمُهَا …',
          options: ['فَاطِمَةُ', 'نَفِيسَةُ', 'لَطِيفَةُ', 'حَفِيظَةُ'],
          correctAnswerIndex: 2,
        ),
        const MultipleChoiceQuestion(
          question: 'الضَّمِيرُ "هُوَ" artinya …',
          options: ['Dia (lk)', 'Dia (pr)', 'Kamu (lk)', 'Saya'],
          correctAnswerIndex: 0,
        ),
        const MultipleChoiceQuestion(
          question: 'ضَمِيرُ الْمُخَاطَبِ لِلْمُذَكَّرِ هُوَ …',
          options: ['هُوَ', 'أَنَا', 'أَنْتَ', 'هِيَ'],
          correctAnswerIndex: 2,
        ),
        const MultipleChoiceQuestion(
          question: 'هَذَا طَالِبٌ. كَلِمَةُ "هَذَا" هِيَ …',
          options: ['خَبَرٌ', 'اِسْمُ إِشَارَةٍ', 'ضَمِيرٌ', 'مُبْتَدَأٌ'],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question: '"هِيَ طَالِبَةٌ" جُمْلَةٌ اِسْمِيَّةٌ مُكَوَّنَةٌ مِنْ …',
          options: [
            'مُبْتَدَأ وَفِعْلٍ',
            'خَبَر وَمَفْعُولٍ',
            'مُبْتَدَأ وَخَبَرٍ',
            'ضَمِير وَفِعْلٍ',
          ],
          correctAnswerIndex: 2,
        ),
        const MultipleChoiceQuestion(
          question: 'مَا مَعْنَى "مِنْ أَيْنَ"؟',
          options: ['Dari siapa', 'Dari mana', 'Apa', 'Siapa'],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question: 'جُمْلَةُ "الْمَدْرَسَةُ جَدِيدَةٌ" الْخَبَرُ هُوَ …',
          options: ['المَدْرَسَةُ', 'جَدِيدَةٌ', 'طَالِبٌ', 'صَدِيقٌ'],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question: 'الصَّبَاحُ الْخَيْرُ maknanya …',
          options: [
            'Selamat siang',
            'Selamat malam',
            'Selamat pagi',
            'Selamat jalan',
          ],
          correctAnswerIndex: 2,
        ),
        const MultipleChoiceQuestion(
          question: 'Kata tunjuk untuk itu (pr) adalah …',
          options: ['هَذَا', 'هَذِهِ', 'ذَلِكَ', 'تِلْكَ'],
          correctAnswerIndex: 3,
        ),
        const MultipleChoiceQuestion(
          question: '"مَنْ هَذَا؟" Jawabannya yang tepat …',
          options: [
            'هَذَا كِتَابٌ',
            'هَذَا أَحْمَدُ',
            'هَذِهِ مَكْتَبَةٌ',
            'ذَلِكَ قَلَمٌ',
          ],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question: '"كَيْفَ حَالُكَ؟" artinya …',
          options: [
            'Apa kabarmu?',
            'Siapa namamu?',
            'Dari mana kamu?',
            'Apakah kamu siswa?',
          ],
          correctAnswerIndex: 0,
        ),
        const MultipleChoiceQuestion(
          question: 'Dalam percakapan, ucapan "مَعَ السَّلَامَةِ" artinya …',
          options: ['Terima kasih', 'Hati-hati', 'Selamat datang', 'Apa kabar'],
          correctAnswerIndex: 1,
        ),
        const MultipleChoiceQuestion(
          question: 'Kata ganti "نَحْنُ" berarti …',
          options: ['Aku', 'Kamu', 'Dia', 'Kita'],
          correctAnswerIndex: 3,
        ),
      ],
    ),

    SectionSeven(
      title: 'B. Mencocokkan (5 soal)',
      subtitle: 'Cocokkan kolom A dengan kolom B!',
      leftColumnTitle: 'Kolom A',
      rightColumnTitle: 'Kolom B',
      chapter: Chapter.bab1,
      kind: Kind.sumatif,
      pairs: [
        const MatchingPair(left: 'هُوَ', right: 'Dia (lk)'),
        const MatchingPair(left: 'هَذِهِ', right: 'Ini (pr)'),
        const MatchingPair(left: 'تِلْكَ', right: 'Itu (pr)'),
        const MatchingPair(left: 'أَنْتَ', right: 'Kamu (lk)'),
        const MatchingPair(left: 'أَنَا', right: 'Saya'),
      ],
    ),

    const SectionFive(
      'C. Isian Singkat (5 soal)',
      'Jawablah pertanyaan-pertanyaan berikut di buku tugas Anda!',
      [
        '1. Lengkapilah kalimat berikut: هَذَا … (siswa)',
        '2. Apa arti ungkapan "مَسَاءُ الْخَيْرِ" dalam bahasa Indonesia?',
        '3. Tuliskan satu contoh kalimat jumlah ismiyah menggunakan mubtada\' dan khabar!',
        '4. Sebutkan 2 contoh ism isyārah untuk mufrad (tunggal)!',
        '5. Jawablah dengan bahasa Arab: "مَنْ أَنْتَ؟"',
      ],
    ),
  ];
}

SimpleMaterialContent get sumatifBab1Content =>
    SimpleMaterialContent(Bab1SumatifData.sections);
