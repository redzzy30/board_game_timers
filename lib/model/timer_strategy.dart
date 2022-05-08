import 'package:board_game_timer/model/timer_content.dart';
import 'package:board_game_timer/model/timer_state.dart';

abstract class TimerStrategy {
  /// Resets the strategy.
  void reset() {}

  /// This method is called whenever a new turn starts
  void onTurnStart() {}

  /// This method is called whenever a turn ends
  void onTurnEnd() {}

  /// This method is called every one second that has passed.
  void doTick();

  /// This method is called after doTick() has been executed
  bool checkIfLost();

  TimerContent createContent(TimerState state);
}

class OnlyMoveTimeStrategy extends TimerStrategy {
  final int timePerMove;
  int _remainingTime;

  OnlyMoveTimeStrategy(this.timePerMove) : _remainingTime = timePerMove;

  @override
  void onTurnStart() => _remainingTime = timePerMove;

  @override
  void doTick() => _remainingTime--;

  @override
  bool checkIfLost() => _remainingTime <= 0;

  @override
  TimerContent createContent(TimerState state) =>
      TimerContent(bigText: _remainingTime, smallText: _remainingTime);
}

abstract class OnlyTotalTimeStrategy extends TimerStrategy {

}