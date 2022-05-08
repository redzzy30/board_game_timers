import 'dart:async' as async;

import 'package:board_game_timer/model/timer.dart';
import 'package:flutter/cupertino.dart';

class TimerManager extends ChangeNotifier {
  final List<Timer> timers;
  Timer? _currentTimer;
  bool _hasEnded;

  TimerManager([List<Timer>? timers])
      : timers = timers ?? [],
        _hasEnded = false {
    final timer = async.Timer.periodic(const Duration(seconds: 1), (_) => doTick());
  }

  Timer? get currentTimer => _currentTimer;

  bool get hasEnded => _hasEnded;

  void addTimer(Timer timer) {
    timers.add(timer);

    _ensureCurrentTimerIsCorrect();
    notifyListeners();
  }

  void removeTimer(Timer timer) {
    timers.removeWhere((other) => identical(other, timer));

    _ensureCurrentTimerIsCorrect();
    notifyListeners();
  }

  void doTick() {
    if (timers.isEmpty) return;

    final currentTimer = _currentTimer!;

    currentTimer.doTick();

    if (currentTimer.hasLost) {
      moveToNextTimerOrEnd();
    }

    notifyListeners();
  }

  void _ensureCurrentTimerIsCorrect() {
    if (_currentTimer == null && timers.isNotEmpty) {
      _currentTimer = timers.first;
      _currentTimer?.startTurn();
    }

    if (_currentTimer != null && timers.isEmpty) {
      _currentTimer?.endTurn();
      _currentTimer = null;
    }
  }

  void moveToNextTimerOrEnd() {
    final nextTimer = _nextActiveTimer();
    _currentTimer?.endTurn();

    if (nextTimer == null) {
      _hasEnded = true;
    } else {
      _currentTimer = nextTimer;
      _currentTimer?.startTurn();
    }

    notifyListeners();
  }

  Timer? _nextActiveTimer() {
    final startIndex = timers.indexOf(_currentTimer!);

    for (var i = 1; i <= timers.length; ++i) {
      var index = startIndex + i;

      if (index > timers.length - 1) {
        index -= timers.length;
      }

      if (!timers[index].hasLost) return timers[index];
    }

    return null;
  }
}
