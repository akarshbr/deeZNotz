import 'package:deeznotz/core/constants/colors.dart';
import 'package:deeznotz/presentation/home/view/widgets/note_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/waterfall_notched_rectangle.dart';
import '../../add_edit_note/view/add_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? _isGridView;
  bool? isEditing = false;
  late SharedPreferences sharedPreferences;

  _loadViewPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _isGridView = (sharedPreferences.getBool('isGridView') ?? true);
    });
  }

  @override
  void initState() {
    _loadViewPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList.separated(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddEditNoteScreen()));
                      },
                      child: const NoteCard(bottom: 0));
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 5,
                    color: DeezNotzColors.bgColorLight,
                  );
                })
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          enableFeedback: true,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddEditNoteScreen()));
          },
          backgroundColor: DeezNotzColors.orange300,
          child: const Icon(Icons.add, size: 30)),
      bottomNavigationBar: BottomAppBar(
        shape: const WaterfallNotchedRectangle(),
        color: DeezNotzColors.blue700,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "deeZNotz",
              style: TextStyle(fontSize: 30, color: DeezNotzColors.white50),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                _isGridView == true ? Icons.menu : Icons.grid_view_rounded,
                color: DeezNotzColors.white50,
                size: 40,
                weight: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
