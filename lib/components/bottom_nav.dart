import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final List<Widget> icons;

  const BottomNav({this.icons = const [], Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        height: 64,
        padding: const EdgeInsets.only(left: 16, right: 16),
        color: Theme
            .of(context)
            .primaryColor,
       child: Row(
         children: icons
       ),
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
