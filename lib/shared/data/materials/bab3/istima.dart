import '../../../../core/utils/section_id_generator.dart';
import '../../../enum/chapter.dart';
import '../../../enum/exercise.dart';
import '../../../enum/kind.dart';
import '../../../models/base/audio_exercise.dart';
import '../../../models/base/material_section.dart';
import '../../../models/material_content.dart';
import '../../../models/templates/section_four.dart';

class Bab3IstimaData {
  static final List<MaterialSection> sections = [
    SectionFour(
      "1. Latihan Mendengar dan Mencocokkan",
      [
        AudioExercise(
          audioFile: 'A - 1.mp3',
          options: [
            'لَوْنُ السَبُّوْرَةِ أَسْوَدٌ',
            'لَوْنُ السَاعَةِ رَمَادِيٌّ',
            'لَوْنُ الْوَرْدَةِ أَحْمَرٌ',
          ],
          correctAnswerIndexes: [1],
        ),
        AudioExercise(
          audioFile: 'A - 2.mp3',
          options: [
            'لَوْنُ الْمِسْطَرَةِ أَخْضَرٌ',
            'لَوْنُ الْخَرِيْطَةِ أَصْفَرٌ',
            'لَوْنُ الْحَقِيْبَةِ وَرْدِيٌّ',
          ],
          correctAnswerIndexes: [2],
        ),
        AudioExercise(
          audioFile: 'A - 3.mp3',
          question:
              'فَصْلِي جَانِبَ (الْمَكْتَبَةِ - الْمَسْجِدِ - الْحَمَّامِ )',
          options: ['الْمَكْتَبَةِ', 'الْمَسْجِدِ', 'الْحَمَّامِ'],
          correctAnswerIndexes: [0],
        ),
        AudioExercise(
          audioFile: 'A - 4.mp3',
          question:
              'في فَصْلِي صُورَةُ . ( الزَّهْرَةُ - السَّبُّوْرَةُ - الْحَائِطُ )',
          options: ['الزَّهْرَةُ', 'السَّبُّوْرَةُ', 'الْحَائِطُ'],
          correctAnswerIndexes: [0],
        ),
        AudioExercise(
          audioFile: 'A - 5.mp3',
          question: 'لَوْنُ السَّبُّوْرَةِ ( أَسْوَدٌ - أَخْضَرٌ - بُنِيٌّ )',
          options: ['أَسْوَدٌ', 'أَخْضَرٌ', 'بُنِيٌّ'],
          correctAnswerIndexes: [2],
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
          audioFile: 'B - 1.mp3',
          question: 'تَسْأَلُ نَجِيبَةُ عَنْ ... فِي فَصْلِ قَانِتَةَ .',
          options: [
            'الأَدَواتِ الـمَدْرَسَة',
            'الأَدَوَاتِ الـمَدْرَسِيَّة',
            'الأَدَوَتِ الـمَدْرَسَة',
            'الأَدَواتِ الـمَدْرَسِيَّه',
          ],
          correctAnswerIndexes: [1],
        ),
        AudioExercise(
          audioFile: 'B - 2.mp3',
          question:
              'يُنَظِّفُ ... الْفَصْلَ بَعْدَ الْجُرَسِ لِلرُّجُوْعِ مِنَ الْمَدْرَسَةِ.',
          options: ['الضُّلاَّبُ', 'الطُّلَّبُ', 'الطُّلاَّبُ', 'الطُّلاَّتُ'],
          correctAnswerIndexes: [2],
        ),
        AudioExercise(
          audioFile: 'B - 3.mp3',
          question:
              'الْأَدَوَاتُ الْمَدْرَسِيَّةُ فِي فَصْلِيْ كَامِلَةٌ ......',
          options: [
            'بِأَلْوَانٍ مُتَبَوِّعَةٍ',
            'بِأَلْوَنٍ مُتَنَوِّعَةٍ',
            'بِأَلْوَانٍ مُتَنَوِّعَةٍ',
            'بِأَلْوَانٍ مُتَنَوِّعَهٍ',
          ],
          correctAnswerIndexes: [2],
        ),
        AudioExercise(
          audioFile: 'B - 4.mp3',
          question: 'اَلسَّبُورَةُ وَ ... وَقَلَمُ الْحِبْرِ.',
          options: [
            'الطَّلاَسَةُ',
            'الطَّلَسَةُ',
            'الطَّلاَشَةُ',
            'الطَّلاَسَهُ',
          ],
          correctAnswerIndexes: [0],
        ),
        AudioExercise(
          audioFile: 'B - 5.mp3',
          question: 'لَا ... الْمُدَرِّسُ بِالطَّبْشُوْرَةِ',
          options: ['يَكْتُبُ', 'تَكْتُبُ', 'يَكْثُبُ', 'يَكَتُبُ'],
          correctAnswerIndexes: [0],
        ),
      ],
      SectionIdGenerator.generateExerciseId(
        Chapter.bab3,
        Kind.istima,
        Exercise.completion,
      ),
      Exercise.completion,
    ),
  ];
}

MaterialContent get istimaBab3Content =>
    MaterialContent(Bab3IstimaData.sections);
