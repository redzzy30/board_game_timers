class TimerStrategy {
  final int totalTime;
  final int timePerMove;
  final int increment;

  const TimerStrategy({
    required this.timePerMove,
    this.totalTime = 0,
    this.increment = 0
  });
}
