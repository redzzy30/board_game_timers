class TimerStrategy {
  final int? totalTime;
  final int? timePerMove;
  final int increment;

  const TimerStrategy({
    this.timePerMove,
    this.totalTime,
    this.increment = 0
  });
}
