import '../../../../core/utils/section_id_generator.dart';
import '../../../enum/chapter.dart';
import '../../../enum/exercise.dart';
import '../../../enum/kind.dart';
import '../../../models/base/audio_exercise.dart';
import '../../../models/base/material_section.dart';
import '../../../models/material_content.dart';
import '../../../models/templates/section_four.dart';

class Bab2IstimaData {
  static final List<MaterialSection> sections = [
    SectionFour(
      "1. Latihan Mendengar dan Mencocokkan",
      [
        AudioExercise(
          audioFile: 'A - 1.mp3',
          options: [
            'الْمِقْلَمَةُ تَحْتَ الْكُرَّاسَةِ',
            'القَلَمُ فِي الحَقِيْبَةِ',
            'الْمِصْبَاحُ فَوْقَ الْمَكْتَبِ',
          ],
          correctAnswerIndexes: [2],
        ),
        AudioExercise(
          audioFile: 'A - 2.mp3',
          options: [
            'الْمُصَلَّى أَمَامَ الْمُلْعَبِ',
            'الْمَسْجِدُ وَرَاءَ الْفَصْلِ',
            'الْمِقْلَمَةُ فِي الرَّفٍّ',
          ],
          correctAnswerIndexes: [1],
        ),
        AudioExercise(
          audioFile: 'A - 3.mp3',
          options: [
            'الْفَصْلُ كَبِيرٌ',
            'الْكُرَّاسَةُ قَبِيحَةٌ',
            'الْحَمَّامُ مُتَّسِخٌ',
            'الْمُدَرِّسُ مَاهِرٌ',
          ],
          correctAnswerIndexes: [2],
        ),
        AudioExercise(
          audioFile: 'A - 4.mp3',
          question: 'مَدْرَسَتِي ( وَرَاءَ - أَمَامَ - جَانِبَ ) الْمَسْجِد',
          options: ['وَرَاءَ', 'أَمَامَ', 'جَانِبَ'],
          correctAnswerIndexes: [0],
        ),
        AudioExercise(
          audioFile: 'A - 5.mp3',
          question:
              'مَدْرَسَتِي فِي شَارِعِ ( حَتَّى - سُوكَارْنُو – سُوْكَارْنِي)',
          options: ['حَتَّى', 'سُوكَارْنُو', 'سُوْكَارْنِي'],
          correctAnswerIndexes: [2],
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
          audioFile: 'B - 1.mp3',
          question: 'فِي مَدْرَسَتِي ...',
          options: [
            'مَعْمَلاَنِ اِثْنَتَانِ',
            'مَعْمَلاَنِ اِسْنَتَانِ',
            'مَعْمَلاَنِ اِشْنَتَانِ',
            'مَعْمَلاَنِ اِتْنَتَانِ',
          ],
          correctAnswerIndexes: [0],
        ),
        AudioExercise(
          audioFile: 'B - 2.mp3',
          question:
              '... اللُّغَةَ الْإِنْجِلِيزِيَّةَ وَاللُّغَةَ الْعَرَبِيَّةَ فِي مَعْمَلِ اللُّغَةِ.',
          options: ['تَئَلَّمُ', 'تَئَلَمُ', 'تَعَلَّمُ', 'تَعَلَّمُوْ'],
          correctAnswerIndexes: [2],
        ),
        AudioExercise(
          audioFile: 'B - 3.mp3',
          question: 'فَصْلِيْ ... غُرْفَةِ الْمُدَرِّسِينَ.',
          options: ['جَنِبَ', 'جَانِبَ', 'جَابِنَ', 'جَابِبَ'],
          correctAnswerIndexes: [1],
        ),
        AudioExercise(
          audioFile: 'B - 4.mp3',
          question: 'الْمَكْتَبَةُ وَقَعَتْ بَيْنَ ... وَغُرْفَةِ الصِّحَّةِ .',
          options: ['الحَمَّام', 'حَمَّام', 'الحَمَّم', 'الحَمَام'],
          correctAnswerIndexes: [0],
        ),
        AudioExercise(
          audioFile: 'B - 5.mp3',
          question:
              'لِأَنَّ ... وَالْمَرَافِقَ الْمَدْرَسِيَّةَ فِي مَدْرَسَتِكَ كَثِيرَةٌ',
          options: [
            'الـمُدَرِّشِيْن',
            'الـمُدَرِّسِنْ',
            'الـمُدَرِّثِيْن',
            'الـمُدَرِّسِيْن',
          ],
          correctAnswerIndexes: [3],
        ),
      ],
      SectionIdGenerator.generateExerciseId(
        Chapter.bab2,
        Kind.istima,
        Exercise.completion,
      ),
      Exercise.completion,
    ),
  ];
}

MaterialContent get istimaBab2Content =>
    MaterialContent(Bab2IstimaData.sections);
