import 'package:deeznotz/core/constants/colors.dart';
import 'package:deeznotz/core/constants/style.dart';
import 'package:deeznotz/core/dummy_data/dummy_data.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.bottom});
  final double bottom;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: size.width*.03,top: size.height*.01,right: size.width*.015),
        margin: EdgeInsets.only(bottom: bottom),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: ColorConstants.cardBGColorLight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DummyData.title,),
            Text(DummyData.desc,overflow: TextOverflow.ellipsis,maxLines: 3,)
          ],
        ),
      ),
    );
  }
}
