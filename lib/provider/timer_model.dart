import 'dart:async';

import 'package:board_game_timer/player_timer.dart';
import 'package:board_game_timer/provider/player.dart';
import 'package:flutter/cupertino.dart';


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
    currentPlayer?.doTick();

    notifyListeners();
  }

  void moveToNextPlayer() {
    _playerIndex++;

    if(_playerIndex > _players.length - 1) {
      _playerIndex = 0;
    }

    notifyListeners();
  }

  Iterable<Player> get players {
    return List.unmodifiable(_players);
  }

  Player? get currentPlayer =>
      _players.isEmpty ? null : _players[_playerIndex];
}
