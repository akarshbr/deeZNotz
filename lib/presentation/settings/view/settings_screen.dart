import 'package:deeznotz/presentation/home/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../widgets/deez_divider_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: FutureBuilder(
          future: Provider.of<SettingsController>(context, listen: false).startFunction(),
          builder: (context, snapshot) {
            return SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.only(left: size.width * .05, top: size.width * .05, right: size.width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Settings",
                      style: textTheme.displayLarge,
                    ),
                    DividerWidget(size: size),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Theme",
                          style: textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        Wrap(
                          spacing: size.width * .05,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.light_mode_outlined),
                              style: IconButton.styleFrom(backgroundColor: DeezNotzColors.black900Alpha020),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode))
                          ],
                        )
                      ],
                    ),
                    DividerWidget(size: size),
                    Row(
                      children: [
                        Text(
                          "Security",
                          style: textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    SizedBox(height: size.width * .03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Enable App Lock",
                          style: textTheme.bodyLarge,
                        ),
                        Switch(
                            value: Provider.of<SettingsController>(context, listen: false).isAppLockOn!,
                            onChanged: (value) {
                              Provider.of<SettingsController>(context, listen: false).toggleAppLock(value);
                              setState(() {
                                Provider.of<SettingsController>(context, listen: false).checkAppLockOn();
                              });
                            })
                      ],
                    ),
                    SizedBox(height: size.width * .03),
                    Visibility(
                      visible: Provider.of<SettingsController>(context, listen: false).isAppLockOn!,
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Set Pin",
                              style: textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                    DividerWidget(size: size),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
