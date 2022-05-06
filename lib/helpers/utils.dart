String formatTime(int seconds) {
  final duration = Duration(seconds: seconds);
  final mm = duration.inMinutes;
  final ss = duration.inSeconds.remainder(60);
  
  return "${mm.toString().padLeft(2, '0')}:${ss.toString().padLeft(2, '0')}";
}