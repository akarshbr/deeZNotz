import 'package:deeznotz/presentation/settings/view/settings_screen.dart';
import 'package:deeznotz/widgets/waterfall_notched_rectangle.dart';
import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class DeezBottomAppBar extends StatelessWidget {
  const DeezBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const WaterfallNotchedRectangle(),
      color: DeezNotzColors.blue700,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "deeZNotz",
            style: TextStyle(fontSize: 30, color: DeezNotzColors.white50),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
              icon: const Icon(
                Icons.settings,
                color: DeezNotzColors.white50,
                size: 25,
              ))
        ],
      ),
    );
  }
}
