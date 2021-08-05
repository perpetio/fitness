class ExerciseData {
  final String title;
  final int minutes;
  final double progress;
  final String video;
  final String description;
  final List<String> steps;

  ExerciseData({
    required this.title,
    required this.minutes,
    required this.progress,
    required this.video,
    required this.description,
    required this.steps,
  });

  @override
  String toString() {
    return 'ExerciseData(title: $title, minutes: $minutes, progress: $progress, video: $video)';
  }
}
