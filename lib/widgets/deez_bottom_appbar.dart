import 'package:deeznotz/widgets/waterfall_notched_rectangle.dart';
import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class DeezBottomAppBar extends StatelessWidget {
  const DeezBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: WaterfallNotchedRectangle(),
      color: DeezNotzColors.blue700,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "deeZNotz",
            style: TextStyle(fontSize: 30, color: DeezNotzColors.white50),
          ),
          Spacer(),
          IconButton(
              onPressed: () {},
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
