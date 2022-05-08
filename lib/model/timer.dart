import 'package:board_game_timer/model/timer_strategy.dart';
import 'package:board_game_timer/model/timer_content.dart';
import 'package:board_game_timer/model/timer_state.dart';

/// Represents the game timer
class Timer {
  final String label;
  final TimerStrategy _strategy;

  TimerState _state;

  Timer(this.label, TimerStrategy strategy)
      : _strategy = strategy,
        _state = TimerState.inactive;

  TimerContent get content => _strategy.createContent(_state);

  TimerState get state => _state;

  bool get hasLost => _state == TimerState.lost;

  void reset() {
    _state = TimerState.inactive;
    _strategy.reset();
  }

  void startTurn() {
    if (_state != TimerState.lost) {
      _state = TimerState.active;
      _strategy.onTurnStart();
    }
  }

  void endTurn() {
    if (_state != TimerState.lost) {
      _state = TimerState.inactive;
      _strategy.onTurnEnd();
    }
  }

  void doTick() {
    _ensureNotLost();
    _strategy.doTick();

    if (_strategy.checkIfLost()) {
      _state = TimerState.lost;
    }
  }

  void _ensureNotLost() {
    if (_state == TimerState.lost) {
      throw Exception("Invalid call, timer is in lost state");
    }
  }
}
