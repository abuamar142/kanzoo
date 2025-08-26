import '../../../../core/utils/section_id_generator.dart';
import '../../../enum/chapter.dart';
import '../../../enum/exercise.dart';
import '../../../enum/kind.dart';
import '../../../models/base/audio_exercise.dart';
import '../../../models/simple_material_content.dart';
import '../../../models/templates/section_four.dart';

SimpleMaterialContent get istimaBab2Content => SimpleMaterialContent([
  SectionFour(
    "1. Latihan Mendengar dan Mencocokkan",
    [
      AudioExercise(
        audioFile: 'bab 2/istima_ bab 2 - A - 1.mp3',
        question:
            'الْمِقْلَمَةُ تَحْتَ الْكُرَّاسَةِ - القَلَمُ فِي الحَقِيْبَةِ - الْمِصْبَاحُ فَوْقَ الْمَكْتَبِ',
        options: [
          'الْمِقْلَمَةُ تَحْتَ الْكُرَّاسَةِ',
          'القَلَمُ فِي الحَقِيْبَةِ',
          'الْمِصْبَاحُ فَوْقَ الْمَكْتَبِ',
        ],
        correctAnswerIndex: 0,
      ),
      AudioExercise(
        audioFile: 'bab 2/istima_ bab 2 - A - 2.mp3',
        question:
            'الْمُصَلَّى أَمَامَ الْمُلْعَبِ - الْمَسْجِدُ وَرَاءَ الْفَصْلِ – الْمِقْلَمَةُ فِي الرَّفٍّ',
        options: [
          'الْمُصَلَّى أَمَامَ الْمُلْعَبِ',
          'الْمَسْجِدُ وَرَاءَ الْفَصْلِ',
          'الْمِقْلَمَةُ فِي الرَّفٍّ',
        ],
        correctAnswerIndex: 1,
      ),
      AudioExercise(
        audioFile: 'bab 2/istima_ bab 2 - A - 3.mp3',
        question:
            'الْفَصْلُ كَبِيرٌ - الْكُرَّاسَةُ قَبِيحَةٌ – الْحَمَّامُ مُتَّسِخٌ - الْمُدَرِّسُ مَاهِرٌ',
        options: [
          'الْفَصْلُ كَبِيرٌ',
          'الْكُرَّاسَةُ قَبِيحَةٌ',
          'الْحَمَّامُ مُتَّسِخٌ',
          'الْمُدَرِّسُ مَاهِرٌ',
        ],
        correctAnswerIndex: 2,
      ),
      AudioExercise(
        audioFile: 'bab 2/istima_ bab 2 - A - 4.mp3',
        question: 'مَدْرَسَتِي ( وَرَاءَ - أَمَامَ - جَانِبَ ) الْمَسْجِد',
        options: ['وَرَاءَ', 'أَمَامَ', 'جَانِبَ'],
        correctAnswerIndex: 1,
      ),
      AudioExercise(
        audioFile: 'bab 2/istima_ bab 2 - A - 5.mp3',
        question:
            'مَدْرَسَتِي فِي شَارِعِ ( حَتَّى - سُوكَارْنُو – سُوْكَارْنِي)',
        options: ['حَتَّى', 'سُوكَارْنُو', 'سُوْكَارْنِي'],
        correctAnswerIndex: 1,
      ),
    ],
    SectionIdGenerator.generateExerciseId(
      Chapter.bab2,
      Kind.istima,
      Exercise.matching,
    ),
    Exercise.matching,
  ),
  SectionFour(
    "2. Melengkapi Kalimat",
    [
      AudioExercise(
        audioFile: 'bab 2/istima_ bab 2 - B - 1.mp3',
        question: 'فِي مَدْرَسَتِي ...',
        options: [
          'فُصُولٌ كَثِيرَةٌ',
          'طُلاَّبٌ قَلِيلُونَ',
          'مُدَرِّسُونَ مَاهِرُونَ',
          'مَكْتَبَةٌ وَاسِعَةٌ',
        ],
        correctAnswerIndex: 0,
      ),
      AudioExercise(
        audioFile: 'bab 2/istima_ bab 2 - B - 2.mp3',
        question:
            '... اللُّغَةَ الْإِنْجِلِيزِيَّةَ وَاللُّغَةَ الْعَرَبِيَّةَ فِي مَعْمَلِ اللُّغَةِ.',
        options: ['نَدْرُسُ', 'نَتَعَلَّمُ', 'نُحِبُّ', 'نَفْهَمُ'],
        correctAnswerIndex: 0,
      ),
      AudioExercise(
        audioFile: 'bab 2/istima_ bab 2 - B - 3.mp3',
        question: 'فَصْلِيْ ... غُرْفَةِ الْمُدَرِّسِينَ.',
        options: ['أَمَامَ', 'وَرَاءَ', 'جَانِبَ', 'فَوْقَ'],
        correctAnswerIndex: 2,
      ),
      AudioExercise(
        audioFile: 'bab 2/istima_ bab 2 - B - 4.mp3',
        question: 'الْمَكْتَبَةُ وَقَعَتْ بَيْنَ ... وَغُرْفَةِ الصِّحَّةِ .',
        options: ['الْفَصْلِ', 'الْمُصَلَّى', 'الْحَمَّامِ', 'الْمُدِيرِ'],
        correctAnswerIndex: 1,
      ),
      AudioExercise(
        audioFile: 'bab 2/istima_ bab 2 - B - 5.mp3',
        question:
            'لِأَنَّ ... وَالْمَرَافِقَ الْمَدْرَسِيَّةَ فِي مَدْرَسَتِكَ كَثِيرَةٌ',
        options: ['الْفُصُولَ', 'الطُّلاَّبَ', 'الْمُدَرِّسِينَ', 'الْكُتُبَ'],
        correctAnswerIndex: 0,
      ),
    ],
    SectionIdGenerator.generateExerciseId(
      Chapter.bab2,
      Kind.istima,
      Exercise.completion,
    ),
    Exercise.completion,
  ),
]);
