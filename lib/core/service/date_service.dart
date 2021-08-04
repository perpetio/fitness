class MinutesSeconds {
  final int minutes;
  final int seconds;

  MinutesSeconds({
    required this.minutes,
    required this.seconds,
  });
}

class DateService {
  static MinutesSeconds convertIntoSeconds(int second) {
    final int minutes = second ~/ 60;
    final int seconds = second % 60;
    return MinutesSeconds(minutes: minutes, seconds: seconds);
  }
}
