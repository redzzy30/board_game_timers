import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        height: 64,
        color: const Color(0xFFF72585),
      ),
      Positioned(
        height: 128,
        width: 128,
        right: 32,
        child: Container(
          height: 96,
          transform: Matrix4.translationValues(0, -72, 0),
          child: ElevatedButton(
            child: const Text(">"),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                textStyle: TextStyle(color: Colors.black),
                shape: const CircleBorder(),
                side: const BorderSide(
                  color: Colors.black,
                  width: 3,
                )),
          ),
        ),
      )
    ]);
  }
}
