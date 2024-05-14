import 'package:deeznotz/core/dummy_data/dummy_data.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.bottom});
  final double bottom;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(left: size.width*.04,top: size.height*.02,right: size.width*.04,bottom: size.height*.02),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${DummyData.dateTime.year}/${DummyData.dateTime.month}/${DummyData.dateTime.day}"),
          SizedBox(height: size.width*.025),
          Text(DummyData.title,style: textTheme.titleLarge,),
          SizedBox(height: size.width*.02),
          const Text(DummyData.desc,overflow: TextOverflow.ellipsis,maxLines: 3,)
        ],
      ),
    );
  }
}
