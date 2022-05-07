import 'package:board_game_timer/components/board.dart';
import 'package:board_game_timer/components/bottom_nav.dart';
import 'package:board_game_timer/components/creator_dialog.dart';
import 'package:board_game_timer/player_timer.dart';
import 'package:board_game_timer/provider/timer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/timer_tile.dart';
import 'helpers/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
      create: (BuildContext context) {
        final model = TimerModel();

        model.add("Jefferson", const TimerStrategy(totalTime: 1000));
        model.add("Charlie", const TimerStrategy(totalTime: 1500));
        model.add("Foxtrot", const TimerStrategy(totalTime: 500, timePerMove: 5));
        model.add("Omega", const TimerStrategy(totalTime: 500, timePerMove: 5));
        model.add("Alfa", const TimerStrategy(totalTime: 500, timePerMove: 5));

        return model;
      },
      child: MaterialApp(
        title: 'Board Game Timers',
        darkTheme: ThemeData(
          primarySwatch: Colors.pink,
          indicatorColor: Colors.white,
          hintColor: Colors.white,

          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
            )
          )
        ),
        themeMode: ThemeMode.dark,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF1e1e24),
      body: const Board(),
      bottomNavigationBar: BottomNav(
        icons: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              showDialog(context: context, builder: (context) {
                return CreatorDialog();
              });
            },
          ),
          const Icon(
            Icons.abc,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
