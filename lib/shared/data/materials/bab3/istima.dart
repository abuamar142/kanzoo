import '../../../../core/utils/section_id_generator.dart';
import '../../../enum/chapter.dart';
import '../../../enum/exercise.dart';
import '../../../enum/kind.dart';
import '../../../models/base/audio_exercise.dart';
import '../../../models/simple_material_content.dart';
import '../../../models/templates/section_four.dart';

SimpleMaterialContent get istimaBab3Content => SimpleMaterialContent([
  SectionFour(
    "1. Latihan Mendengar dan Mencocokkan",
    [
      AudioExercise(
        audioFile: 'bab 3/istima_ bab 3 - A - 1.mp3',
        question:
            'لَوْنُ السَبُّوْرَةِ أَسْوَدٌ - لَوْنُ السَاعَةِ رَمَادِيٌّ - لَوْنُ الْوَرْدَةِ أَحْمَرٌ',
        options: [
          'لَوْنُ السَبُّوْرَةِ أَسْوَدٌ',
          'لَوْنُ السَاعَةِ رَمَادِيٌّ',
          'لَوْنُ الْوَرْدَةِ أَحْمَرٌ',
        ],
        correctAnswerIndex: 0,
      ),
      AudioExercise(
        audioFile: 'bab 3/istima_ bab 3 - A - 2.mp3',
        question:
            'لَوْنُ الْمِسْطَرَةِ أَخْضَرٌ - لَوْنُ الْخَرِيْطَةِ أَصْفَرٌ - لَوْنُ الْحَقِيْبَةِ وَرْدِيٌّ',
        options: [
          'لَوْنُ الْمِسْطَرَةِ أَخْضَرٌ',
          'لَوْنُ الْخَرِيْطَةِ أَصْفَرٌ',
          'لَوْنُ الْحَقِيْبَةِ وَرْدِيٌّ',
        ],
        correctAnswerIndex: 1,
      ),
      AudioExercise(
        audioFile: 'bab 3/istima_ bab 3 - A - 3.mp3',
        question:
            'فَصْلِي جَانِبَ (الْمَكْتَبَةِ - الْمَسْجِدِ - الْحَمَّامِ )',
        options: ['الْمَكْتَبَةِ', 'الْمَسْجِدِ', 'الْحَمَّامِ'],
        correctAnswerIndex: 0,
      ),
      AudioExercise(
        audioFile: 'bab 3/istima_ bab 3 - A - 4.mp3',
        question:
            'في فَصْلِي صُورَةُ . ( الزَّهْرَةُ - السَّبُّوْرَةُ - الْحَائِطُ )',
        options: ['الزَّهْرَةُ', 'السَّبُّوْرَةُ', 'الْحَائِطُ'],
        correctAnswerIndex: 0,
      ),
      AudioExercise(
        audioFile: 'bab 3/istima_ bab 3 - A - 5.mp3',
        question: 'لَوْنُ السَّبُّوْرَةِ ( أَسْوَدٌ - أَخْضَرٌ - بُنِيٌّ )',
        options: ['أَسْوَدٌ', 'أَخْضَرٌ', 'بُنِيٌّ'],
        correctAnswerIndex: 0,
      ),
    ],
    SectionIdGenerator.generateExerciseId(
      Chapter.bab3,
      Kind.istima,
      Exercise.matching,
    ),
    Exercise.matching,
  ),
  SectionFour(
    "2. Melengkapi Kalimat",
    [
      AudioExercise(
        audioFile: 'bab 3/istima_ bab 3 - B - 1.mp3',
        question: 'تَسْأَلُ نَجِيبَةُ عَنْ ... فِي فَصْلِ قَانِتَةَ',
        options: [
          'الطُّلاَّبِ',
          'الْأَدَوَاتِ الْمَدْرَسِيَّةِ',
          'الْمُدَرِّسِينَ',
          'الْكُتُبِ',
        ],
        correctAnswerIndex: 1,
      ),
      AudioExercise(
        audioFile: 'bab 3/istima_ bab 3 - B - 2.mp3',
        question:
            'يُنَظِّفُ ... الْفَصْلَ بَعْدَ الْجُرَسِ لِلرُّجُوْعِ مِنَ الْمَدْرَسَةِ',
        options: [
          'الطُّلاَّبُ',
          'الْمُدَرِّسُونَ',
          'الْبَوَّابُ',
          'الْخَادِمُ',
        ],
        correctAnswerIndex: 0,
      ),
      AudioExercise(
        audioFile: 'bab 3/istima_ bab 3 - B - 3.mp3',
        question: 'الْأَدَوَاتُ الْمَدْرَسِيَّةُ فِي فَصْلِيْ كَامِلَةٌ',
        options: ['نَعَمْ', 'لاَ', 'قَلِيلَةٌ', 'كَثِيرَةٌ'],
        correctAnswerIndex: 0,
      ),
      AudioExercise(
        audioFile: 'bab 3/istima_ bab 3 - B - 4.mp3',
        question: 'اَلسَّبُورَةُ وَ ... وَقَلَمُ الْحِبْرِ',
        options: [
          'الطَّبْشُورَةُ',
          'الْقَلَمُ',
          'الْكُرَّاسَةُ',
          'الْمِسْطَرَةُ',
        ],
        correctAnswerIndex: 0,
      ),
      AudioExercise(
        audioFile: 'bab 3/istima_ bab 3 - B - 5.mp3',
        question: 'لَا ... الْمُدَرِّسُ بِالطَّبْشُوْرَةِ',
        options: ['يَكْتُبُ', 'يَقْرَأُ', 'يَشْرَحُ', 'يُدَرِّسُ'],
        correctAnswerIndex: 0,
      ),
    ],
    SectionIdGenerator.generateExerciseId(
      Chapter.bab3,
      Kind.istima,
      Exercise.completion,
    ),
    Exercise.completion,
  ),
]);
