import 'package:deeznotz/core/constants/colors.dart';
import 'package:deeznotz/core/constants/style.dart';
import 'package:deeznotz/core/dummy_data/dummy_data.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: size.width*.03,top: size.height*.01,right: size.width*.015),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorConstants.cardBGColorLight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DummyData.title,style: StyleVariables.cardTitleTextStyleLight,),
            Text(DummyData.desc,overflow: TextOverflow.ellipsis,maxLines: 3,style: StyleVariables.cardDescTextStyleLight)
          ],
        ),
      ),
    );
  }
}
