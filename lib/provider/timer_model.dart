import 'package:board_game_timer/player_timer.dart';
import 'package:flutter/cupertino.dart';

class Player {
  final String playerName;
  final TimerStrategy strategy;

  int remainingTime;
  int remainingMoveTime;

  Player(this.playerName, this.strategy)
      : remainingTime = strategy.totalTime,
        remainingMoveTime = 0;

  void selectForMove() {}

  void doTick() {}

  void endMove() {}
}

class TimerModel extends ChangeNotifier {
  final Map<String, Player> _players = {};

  late Player _currentPlayer;

  void add(String playerName, TimerStrategy strategy) {
    _players[playerName] = Player(
      playerName,
      strategy,
    );

    notifyListeners();
  }

  void doTick() {
    _players.forEach((key, value) => value.doTick());
  }

  void moveToNextPlayer() {}
}
