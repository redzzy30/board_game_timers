import 'package:board_game_timer/colors.dart';
import 'package:flutter/material.dart';

enum TimerTileState { active, awaiting, eliminated, nonInGame }

class TimerTileColors {
  final Color color;
  final Color textColor;

  const TimerTileColors(this.color, this.textColor);
}

const _textColorMap = {
  TimerTileState.active: TimerTileColors(
    AppColors.activeBackground,
    AppColors.activeForeground,
  ),
  TimerTileState.awaiting: TimerTileColors(
    AppColors.inactiveBackground,
    AppColors.inactiveForeground,
  ),
  TimerTileState.eliminated: TimerTileColors(
    AppColors.eliminatedBackground,
    AppColors.eliminatedForeground,
  ),
  TimerTileState.nonInGame: TimerTileColors(
    AppColors.inactiveBackground,
    AppColors.inactiveForeground,
  ),
};

class TimerTile extends StatelessWidget {
  final String playerName;
  final String bigText;
  final String smallText;
  final TimerTileState state;

  const TimerTile({
    required this.state,
    this.playerName = "",
    this.bigText = "",
    this.smallText = "",
  });

  @override
  Widget build(BuildContext context) {
    final colors = _textColorMap[state]!;

    final smallTextStyle = TextStyle(
      color: colors.textColor,
      fontSize: 24,
    );

    final bigTextStyle = TextStyle(
      color: colors.textColor,
      fontSize: 256,
    );

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colors.color,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(playerName, style: smallTextStyle),
              Text(smallText, style: smallTextStyle),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  bigText,
                  style: bigTextStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
