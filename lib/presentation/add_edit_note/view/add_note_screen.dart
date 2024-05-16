import 'package:deeznotz/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({super.key, this.title, this.description,required this.isEditing});

  final String? title;
  final String? description;
  final bool isEditing;

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.title != null && widget.description != null) {
      titleController.text = widget.title!;
      descriptionController.text = widget.description!;
    }
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
                widget.isEditing ? "Edit Your Notz" : "Add Your Notz",
                style: textTheme.displayLarge,
              ),
            ),
            Divider(
              indent: size.width * .05,
              endIndent: size.width * .05,
              thickness: size.height * .002,
              color: DeezNotzColors.blue700,
            ),
            TextFormField(
              controller: titleController,
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
                controller: descriptionController,
                style: textTheme.bodyLarge,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: textTheme.bodyLarge,
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
