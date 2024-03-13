import 'package:flutter/material.dart';
class StyleVariables{
  static SliverToBoxAdapter sliverSizedBox(double height) {
    return SliverToBoxAdapter(
      child: SizedBox(height: height),
    );
  }
}