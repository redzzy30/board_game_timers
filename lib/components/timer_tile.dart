import 'package:board_game_timer/colors.dart';
import 'package:board_game_timer/model/timer_state.dart';
import 'package:flutter/material.dart';

class _TimerTileColors {
  final Color color;
  final Color textColor;

  const _TimerTileColors(this.color, this.textColor);
}

const _textColorMap = {
  TimerState.active: _TimerTileColors(
    AppColors.activeBackground,
    AppColors.activeForeground,
  ),
  TimerState.inactive: _TimerTileColors(
    AppColors.inactiveBackground,
    AppColors.inactiveForeground,
  ),
  TimerState.lost: _TimerTileColors(
    AppColors.eliminatedBackground,
    AppColors.eliminatedForeground,
  ),
};

class TimerTile extends StatelessWidget {
  final String playerName;
  final String bigText;
  final String smallText;
  final TimerState state;

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
