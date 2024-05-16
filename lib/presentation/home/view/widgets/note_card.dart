import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, this.title, this.description, this.dateTime});


  final String? title;
  final String? description;
  final DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(
          left: size.width * .04, top: size.height * .02, right: size.width * .04, bottom: size.height * .02),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${dateTime?.year}/${dateTime?.month}/${dateTime?.day}"),
          SizedBox(height: size.width * .025),
          Text(
            title ?? "",
            style: textTheme.titleLarge,
          ),
          SizedBox(height: size.width * .02),
          Text(
            description ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          )
        ],
      ),
    );
  }
}
