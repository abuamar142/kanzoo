import '../../../../core/utils/section_id_generator.dart';
import '../../../enum/chapter.dart';
import '../../../enum/exercise.dart';
import '../../../enum/kind.dart';
import '../../../models/base/audio_exercise.dart';
import '../../../models/simple_material_content.dart';
import '../../../models/templates/section_four.dart';

SimpleMaterialContent get istimaBab1Content => SimpleMaterialContent([
  SectionFour(
    "1. Latihan Mendengar dan Mencocokkan",
    [
      AudioExercise(
        audioFile: 'bab 1/istima_ bab 1 - A - 1.mp3',
        question:
            'صَبَاحُ الْخَيْرِ - مَسَاءُ الْخَيْرِ - سَعِيدٌ مُبَارَكٌ - سَعِيدَةٌ مُبَارَكَةٌ',
        options: [
          'صَبَاحُ الْخَيْرِ',
          'مَسَاءُ الْخَيْرِ',
          'سَعِيدٌ مُبَارَكٌ',
          'سَعِيدَةٌ مُبَارَكَةٌ',
        ],
        correctAnswerIndex: 0,
      ),
      AudioExercise(
        audioFile: 'bab 1/istima_ bab 1 - A - 2.mp3',
        question:
            'نَهَارُكَ سَعِيدٌ - مَسَاءُ النُّوْرِ - صَبَاحُ النُّوْرِ - لَيْلَتُكَ سَعِيدَة',
        options: [
          'نَهَارُكَ سَعِيدٌ',
          'مَسَاءُ النُّوْرِ',
          'صَبَاحُ النُّوْرِ',
          'لَيْلَتُكَ سَعِيدَة',
        ],
        correctAnswerIndex: 1,
      ),
      AudioExercise(
        audioFile: 'bab 1/istima_ bab 1 - A - 3.mp3',
        question:
            'الْحَمْدُ لله بِخَيْر - إِلَى اللقَاءِ - مَعَ السَّلَامَةِ - كَيْفَ حَالُكَ',
        options: [
          'الْحَمْدُ لله بِخَيْر',
          'إِلَى اللقَاءِ',
          'مَعَ السَّلَامَةِ',
          'كَيْفَ حَالُكَ',
        ],
        correctAnswerIndex: 3,
      ),
      AudioExercise(
        audioFile: 'bab 1/istima_ bab 1 - A - 4.mp3',
        question: 'طَالِب - نَاظِر - بَائِع – سَائِق',
        options: ['طَالِب', 'نَاظِر', 'بَائِع', 'سَائِق'],
        correctAnswerIndex: 0,
      ),
      AudioExercise(
        audioFile: 'bab 1/istima_ bab 1 - A - 5.mp3',
        question: 'مُوَظّف - بَوَّابَ - رَئِيسُ – خَادِم',
        options: ['مُوَظّف', 'بَوَّابَ', 'رَئِيسُ', 'خَادِم'],
        correctAnswerIndex: 1,
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
        audioFile: 'bab 1/istima_ bab 1 - B - 1.mp3',
        question: '... فِي الْفَصْلِ السَّابِعِ "ب"',
        options: ['أَنَا', 'أَدْرُسُ', 'أَسْكُنُ', 'أَذْهَبُ'],
        correctAnswerIndex: 1,
      ),
      AudioExercise(
        audioFile: 'bab 1/istima_ bab 1 - B - 2.mp3',
        question: 'أَسْكُنُ فِي...',
        options: [
          'الْمَدْرَسَةِ',
          'الْفَصْلِ',
          'شَارِعِ الْمَلاَطِي',
          'الْمَكْتَبَةِ',
        ],
        correctAnswerIndex: 2,
      ),
      AudioExercise(
        audioFile: 'bab 1/istima_ bab 1 - B - 3.mp3',
        question: 'بيتك ... مِنَ الْمَسْجِدِ.',
        options: ['قَرِيبٌ', 'بَعِيدٌ', 'كَبِيرٌ', 'صَغِيرٌ'],
        correctAnswerIndex: 0,
      ),
      AudioExercise(
        audioFile: 'bab 1/istima_ bab 1 - B - 4.mp3',
        question: 'تَسْتَطِيعُ أَنْ تَزُورَ بَيْتِي فِي...',
        options: ['الصَّبَاحِ', 'الْمَسَاءِ', 'يَوْمِ الْأَحَدِ', 'اللَّيْلِ'],
        correctAnswerIndex: 2,
      ),
      AudioExercise(
        audioFile: 'bab 1/istima_ bab 1 - B - 5.mp3',
        question: 'أَنَا ... بِمَعْرِفَتِكَ',
        options: ['سَعِيدٌ', 'سُرُورٌ', 'مَسْرُورٌ', 'فَرِحٌ'],
        correctAnswerIndex: 2,
      ),
    ],
    SectionIdGenerator.generateExerciseId(
      Chapter.bab1,
      Kind.istima,
      Exercise.completion,
    ),
    Exercise.completion,
  ),
]);
