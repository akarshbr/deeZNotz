import 'package:deeznotz/core/constants/colors.dart';
import 'package:deeznotz/core/dummy_data/dummy_data.dart';
import 'package:deeznotz/presentation/home/view/widgets/note_card.dart';
import 'package:flutter/material.dart';

import '../../../widgets/deez_bottom_appbar.dart';
import '../../add_edit_note/view/add_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList.separated(
              itemCount: DummyData.dummyData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddEditNoteScreen(
                          title: DummyData.dummyData[index]["title"],
                          description: DummyData.dummyData[index]["description"],
                          isEditing: true,
                        ),
                      ),
                    );
                  },
                  child: NoteCard(
                    title: DummyData.dummyData[index]["title"],
                    description: DummyData.dummyData[index]["description"],
                    dateTime: DummyData.dummyData[index]["dateTime"],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 5,
                  color: DeezNotzColors.bgColorLight,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          enableFeedback: true,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddEditNoteScreen(isEditing: false),
              ),
            );
          },
          backgroundColor: DeezNotzColors.orange300,
          child: const Icon(Icons.add, size: 30)),
      bottomNavigationBar: const DeezBottomAppBar(),
    );
  }
}
