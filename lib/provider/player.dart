import 'dart:math';

import '../player_timer.dart';

class Player {
  static int _nextId = 0;

  final String playerName;
  final TimerStrategy strategy;
  final int id;

  final bool useRemainingTime;
  final bool useRemainingMoveTime;

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
    if(strategy.totalTime != null) {
      remainingMoveTime = min(strategy.timePerMove ?? 0, strategy.totalTime ?? 0);
    } else {
      remainingMoveTime = strategy.timePerMove ?? 0;
    }
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
