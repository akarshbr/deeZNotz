import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: size.height * .002,
      color: DeezNotzColors.blue700,
    );
  }
}