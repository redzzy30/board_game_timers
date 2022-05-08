import 'package:board_game_timer/components/timer_tile.dart';
import 'package:board_game_timer/model/timer.dart';
import 'package:board_game_timer/model/timer_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/utils.dart';

/// Displays the players' timers
class Board extends StatelessWidget {
  final bool isCountingDown;

  const Board({
    this.isCountingDown = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TimerManager>();
    final tiles = model.timers.map(
      (timer) => _createTile(timer),
    );

    return GestureDetector(
      onTap: () {
        model.moveToNextTimerOrEnd();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: GridView.count(crossAxisCount: 2, children: tiles.toList()),
        ),
      ),
    );
  }

  Widget _createTile(Timer timer) {
    final content = timer.content;

    return TimerTile(
      state: timer.state,
      playerName: timer.label,
      smallText: content.smallText,
      bigText: content.bigText,
    );
  }
}
