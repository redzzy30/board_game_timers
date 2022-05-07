import 'package:board_game_timer/colors.dart';
import 'package:flutter/material.dart';

class CreatorDialog extends StatefulWidget {
  const CreatorDialog({Key? key}) : super(key: key);

  @override
  State<CreatorDialog> createState() => _CreatorDialogState();
}

class _CreatorDialogState extends State<CreatorDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.background,
      insetPadding: EdgeInsets.zero,
      content: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 300),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            "Add a new player",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          TextField(onChanged: (value) {},),
          TextField(onChanged: (value) {}, keyboardType: TextInputType.number),
          TextField(onChanged: (value) {}, keyboardType: TextInputType.number),
        ]),
      ),
    );
  }
}
