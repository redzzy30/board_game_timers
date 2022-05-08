import 'package:board_game_timer/helpers/utils.dart';

class TimerContent {
  final String? bigText;
  final String? smallText;

  TimerContent({
    int? bigText,
    int? smallText,
  })  : bigText = bigText != null ? formatTime(bigText) : null,
        smallText = smallText != null ? formatTime(smallText) : null;
}
