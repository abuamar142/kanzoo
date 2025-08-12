class ExerciseSet {
  final String id;
  final String materialId;
  final String title;
  final String description;
  final int timeLimitSec; // refer to AppTiming defaults

  const ExerciseSet({
    required this.id,
    required this.materialId,
    required this.title,
    required this.description,
    required this.timeLimitSec,
  });
}

