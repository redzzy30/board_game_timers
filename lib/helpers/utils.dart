String formatTime(int seconds) {
  final duration = Duration(seconds: seconds);
  return "${duration.inMinutes}:${duration.inSeconds.remainder(60)}";
}
