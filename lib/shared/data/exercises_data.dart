import '../../core/constants/app_constants.dart';
import '../../core/constants/app_timing.dart';
import '../models/exercise_set.dart';

class ExercisesData {
  static final List<ExerciseSet> sets = [
    // Intro
    ExerciseSet(
      id: 'intro-1',
      materialId: 'intro',
      title: '${AppConstants.dictionarySectionIntroduction} 1',
      description: 'Kata ganti orang dasar',
      timeLimitSec: AppTiming.shortTimeLimit,
    ),
    ExerciseSet(
      id: 'intro-2',
      materialId: 'intro',
      title: '${AppConstants.dictionarySectionIntroduction} 2',
      description: 'Latihan kalimat sederhana',
      timeLimitSec: AppTiming.defaultTimeLimit,
    ),

    // Demonstratives
    ExerciseSet(
      id: 'demo-1',
      materialId: 'demo',
      title: '${AppConstants.dictionarySectionDemonstratives} 1',
      description: 'هذا/هذه dan ذلك/تلك',
      timeLimitSec: AppTiming.shortTimeLimit,
    ),

    // Numbers
    ExerciseSet(
      id: 'numbers-1',
      materialId: 'numbers',
      title: 'Angka Dasar',
      description: 'Angka 1–10',
      timeLimitSec: AppTiming.shortTimeLimit,
    ),
    ExerciseSet(
      id: 'numbers-2',
      materialId: 'numbers',
      title: 'Angka Lanjutan',
      description: 'Penggunaan angka dalam kalimat',
      timeLimitSec: AppTiming.defaultTimeLimit,
    ),

    // Family
    ExerciseSet(
      id: 'family-1',
      materialId: 'family',
      title: 'Keluarga 1',
      description: 'Kosakata keluarga',
      timeLimitSec: AppTiming.shortTimeLimit,
    ),
  ];

  static List<ExerciseSet> byMaterial(String materialId) {
    return sets.where((e) => e.materialId == materialId).toList();
  }
}

