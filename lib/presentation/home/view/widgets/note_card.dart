import 'package:deeznotz/core/dummy_data/dummy_data.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.bottom});
  final double bottom;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: size.width*.03,top: size.height*.01,right: size.width*.015),
        margin: EdgeInsets.only(bottom: bottom),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${DummyData.dateTime.year}/${DummyData.dateTime.month}/${DummyData.dateTime.day}"),
            SizedBox(height: size.width*.01),
            Text(DummyData.title,style: textTheme.titleLarge,),
            SizedBox(height: size.width*.01),
            const Text(DummyData.desc,overflow: TextOverflow.ellipsis,maxLines: 3,)
          ],
        ),
      ),
    );
  }
}
