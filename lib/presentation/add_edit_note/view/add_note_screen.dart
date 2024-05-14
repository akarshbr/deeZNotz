import 'package:deeznotz/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({super.key});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * .05, top: size.width * .05),
              child: Text(
                "Add Your Notz",
                style: textTheme.displayLarge,
              ),
            ),
            Divider(
              indent: size.width * .05,
              endIndent: size.width * .05,
              thickness: size.height*.002,
              color: DeezNotzColors.blue700,
            ),
            TextFormField(
              style: textTheme.labelLarge,
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: textTheme.labelLarge,
                isDense: false,
                contentPadding: EdgeInsets.all(size.width * .05),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
            Expanded(
              child: TextFormField(
                style: textTheme.titleLarge,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: textTheme.titleLarge,
                  isDense: false,
                  contentPadding: EdgeInsets.all(size.width * .05),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
