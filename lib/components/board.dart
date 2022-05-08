import 'package:board_game_timer/components/timer_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/utils.dart';
import '../model/player.dart';
import '../provider/timer_model.dart';

/// Displays the players' timers
class Board extends StatelessWidget {
  final List<Player> players;
  final bool isCountingDown;

  const Board({
    this.players = const [],
    this.isCountingDown = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TimerModel>();
    final tiles = model.players.map(
      (player) => _createPlayerTile(player, model),
    );

    return GestureDetector(
      onTap: () {
        model.moveToNextPlayer();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: GridView.count(crossAxisCount: 2, children: tiles.toList()),
        ),
      ),
    );
  }

  Widget _createPlayerTile(Player player, TimerModel model) {
    final isActive = model.currentPlayer?.id == player.id;
    var text = [0, 0]; // big, small

    if (player.useRemainingMoveTime && !player.useRemainingTime) {
      text = isActive
          ? [player.remainingMoveTime, 0]
          : [player.remainingMoveTime, player.remainingMoveTime];
    } else if (player.useRemainingTime && !player.useRemainingMoveTime) {
      text = isActive
          ? [player.remainingTime, 0]
          : [player.remainingTime, player.remainingTime];
    } else if (player.useRemainingTime && player.useRemainingMoveTime) {
      text = isActive
          ? [player.remainingMoveTime, player.remainingTime]
          : [player.remainingMoveTime, player.remainingTime];
    }

    return TimerTile(
      state: isActive ? TimerTileState.active : TimerTileState.awaiting,
      playerName: player.playerName,
      smallText: formatTime(text[0]),
      bigText: formatTime(player.remainingTime),
    );
  }
}
