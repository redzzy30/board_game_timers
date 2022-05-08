import 'package:board_game_timer/model/timer_strategy.dart';
import 'package:flutter_test/flutter_test.dart';

void _doTurn(
  TimerStrategy strategy,
  void Function(TimerStrategy strategy) callback,
) {
  strategy.onTurnStart();
  callback(strategy);
  strategy.onTurnEnd();
}

void main() {
  group('OnlyMoveTimeStrategy', () {
    test('Loses when time reaches 0', () {
      _doTurn(OnlyMoveTimeStrategy(1), (strategy) {
        expect(strategy.checkIfLost(), false);

        strategy.doTick();
        expect(strategy.checkIfLost(), true);
      });
    });

    test('Time resets after end of turn', () {
      final strategy = OnlyMoveTimeStrategy(2);

      _doTurn(strategy, (s) => s.doTick());
      _doTurn(strategy, (s) => s.doTick());
      _doTurn(strategy, (s) => s.doTick());

      expect(strategy.checkIfLost(), false);
    });
  });
}
