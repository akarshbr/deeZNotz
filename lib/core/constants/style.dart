import 'package:flutter/material.dart';
class StyleVariables{

  static const TextStyle logoStyleLight =TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
  static const TextStyle cardTitleTextStyleLight =TextStyle(fontWeight: FontWeight.bold,fontSize: 30);
  static const TextStyle cardDescTextStyleLight =TextStyle();
  static const TextStyle splashTextStyleLight = TextStyle(fontSize: 30,fontWeight: FontWeight.bold);

  static SliverToBoxAdapter sliverSizedBox(double height) {
    return SliverToBoxAdapter(
      child: SizedBox(height: height),
    );
  }
}