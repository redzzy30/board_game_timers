import 'dart:async';

import 'package:board_game_timer/player_timer.dart';
import 'package:flutter/cupertino.dart';

class Player {
  static int _nextId = 0;

  final String playerName;
  final TimerStrategy strategy;
  final int id;

  bool useRemainingTime;
  bool useRemainingMoveTime;
  bool hasLost;

  int remainingTime = 0;
  int remainingMoveTime = 0;

  Player(this.playerName, this.strategy)
      : useRemainingMoveTime = strategy.timePerMove != null,
        useRemainingTime = strategy.totalTime != null,
        hasLost = false,
        id = _nextId++ {
    reset();
  }

  void reset() {
    remainingTime = strategy.totalTime ?? 0;
    remainingMoveTime = strategy.timePerMove ?? 0;

    hasLost = false;
  }

  void selectForMove() {
    remainingMoveTime = strategy.timePerMove ?? 0;
  }

  void doTick() {
    if (hasLost) return;

    if (useRemainingMoveTime) _doTickRemainingMoveTime();
    if (useRemainingTime) _doTickRemainingTime();
  }

  void endMove() {}

  void _doTickRemainingMoveTime() {
    remainingMoveTime--;

    if (remainingMoveTime <= 0) {
      _lose();
    }
  }

  void _doTickRemainingTime() {
    remainingTime--;

    if (remainingTime <= 0) {
      _lose();
    }
  }

  void _lose() {
    hasLost = true;
  }
}

class TimerModel extends ChangeNotifier {
  final List<Player> _players = [];

  int _playerIndex = 0;

  TimerModel() {
    Timer.periodic(const Duration(seconds: 1), (_) => doTick());
  }

  void add(String playerName, TimerStrategy strategy) {
    final player = Player(
      playerName,
      strategy,
    );

    _players.add(player);

    notifyListeners();
  }

  void doTick() {
    _currentPlayer?.doTick();

    notifyListeners();
  }

  void moveToNextPlayer() {
    notifyListeners();
  }

  Iterable<Player> get players {
    return List.unmodifiable(_players);
  }

  Player? get _currentPlayer =>
      _players.isEmpty ? null : _players[_playerIndex];
}
