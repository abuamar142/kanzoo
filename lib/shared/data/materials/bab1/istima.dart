import '../../../../core/utils/section_id_generator.dart';
import '../../../enum/chapter.dart';
import '../../../enum/exercise.dart';
import '../../../enum/kind.dart';
import '../../../models/base/audio_exercise.dart';
import '../../../models/base/material_section.dart';
import '../../../models/material_content.dart';
import '../../../models/templates/section_four.dart';

class Bab1IstimaData {
  static final List<MaterialSection> sections = [
    SectionFour(
      "1. Latihan Mendengar dan Mencocokkan",
      [
        AudioExercise(
          audioFile: 'A - 1.mp3',
          options: [
            'صَبَاحُ الْخَيْرِ',
            'مَسَاءُ الْخَيْرِ',
            'سَعِيدٌ مُبَارَكٌ',
            'سَعِيدَةٌ مُبَارَكَةٌ',
          ],
          correctAnswerIndexes: [0, 2],
        ),
        AudioExercise(
          audioFile: 'A - 2.mp3',
          options: [
            'نَهَارُكَ سَعِيدٌ',
            'مَسَاءُ النُّوْرِ',
            'صَبَاحُ النُّوْرِ',
            'لَيْلَتُكَ سَعِيدَة',
          ],
          correctAnswerIndexes: [1, 3],
        ),
        AudioExercise(
          audioFile: 'A - 3.mp3',
          options: [
            'الْحَمْدُ لله بِخَيْر',
            'إِلَى اللقَاءِ',
            'مَعَ السَّلَامَةِ',
            'كَيْفَ حَالُكَ',
          ],
          correctAnswerIndexes: [0, 1],
        ),
        AudioExercise(
          audioFile: 'A - 4.mp3',
          options: ['طَالِب', 'نَاظِر', 'بَائِع', 'سَائِق'],
          correctAnswerIndexes: [1, 2],
        ),
        AudioExercise(
          audioFile: 'A - 5.mp3',
          options: ['مُوَظّف', 'بَوَّابَ', 'رَئِيسُ', 'خَادِم'],
          correctAnswerIndexes: [0, 2],
        ),
      ],
      SectionIdGenerator.generateExerciseId(
        Chapter.bab1,
        Kind.istima,
        Exercise.matching,
      ),
      Exercise.matching,
    ),
    SectionFour(
      "2. Melengkapi Kalimat",
      [
        AudioExercise(
          audioFile: 'B - 1.mp3',
          question: '... فِي الْفَصْلِ السَّابِعِ "ب"',
          options: ['أَدْرُسُ', 'أَدْرُصُ', 'أَدْخُسُ', 'أَغْرُسُ'],
          correctAnswerIndexes: [0],
        ),
        AudioExercise(
          audioFile: 'B - 2.mp3',
          question: 'أَسْكُنُ فِي...',
          options: [
            'شَرِعْ سُوْدِرْمَان',
            'شَارِعْ سُوْدِرْمَان',
            'شَارِءْ سُوْدِرْمَان',
            'شَرِيْعْ سُوْدِرْمَان',
          ],
          correctAnswerIndexes: [1],
        ),
        AudioExercise(
          audioFile: 'B - 3.mp3',
          question: 'بَيْتُكَ ... مِنَ الْمَسْجِدِ.',
          options: ['قَزِيْبٌ', 'قَرِبٌ', 'كَرِيْبٌ', 'قَرِيْبٌ'],
          correctAnswerIndexes: [3],
        ),
        AudioExercise(
          audioFile: 'B - 4.mp3',
          question: 'تَسْتَطِيعُ أَنْ تَزُورَ بَيْتِي فِي...',
          options: [
            'يَوْمِ الحُمُعَة',
            'يَوْمِ الخُمُعَة',
            'يَوْمِ الجُمُعَة',
            'يَوْمِ الجُمُغَة',
          ],
          correctAnswerIndexes: [2],
        ),
        AudioExercise(
          audioFile: 'B - 5.mp3',
          question: 'أَنَا ... بِمَعْرِفَتِكَ',
          options: ['سَعِيدٌ', 'مَسْرُورٌ', 'فَرِحٌ', 'مَسْرُورٌ'],
          correctAnswerIndexes: [1],
        ),
      ],
      SectionIdGenerator.generateExerciseId(
        Chapter.bab1,
        Kind.istima,
        Exercise.completion,
      ),
      Exercise.completion,
    ),
  ];
}

MaterialContent get istimaBab1Content =>
    MaterialContent(Bab1IstimaData.sections);
