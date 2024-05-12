import 'package:deeznotz/core/constants/colors.dart';
import 'package:deeznotz/core/constants/style.dart';
import 'package:deeznotz/presentation/home/controller/settings_controller.dart';
import 'package:deeznotz/presentation/home/view/widgets/note_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   bool? _isGridView;
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.bgColorLight,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: CustomScrollView(
          slivers: [
            StyleVariables.sliverSizedBox(40),
            SliverToBoxAdapter(
              child: Center(
                child: SizedBox(
                  width: size.width * .95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("deeZNotz", style: StyleVariables.logoStyleLight),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _isGridView = !_isGridView!;
                              Provider.of<SettingsController>(context, listen: false)
                                  .saveViewPreference(_isGridView!);
                            });
                          },
                          icon: Icon(
                            _isGridView==true ? Icons.menu : Icons.grid_view_rounded,
                            color: Colors.black,
                            size: 50,
                            weight: 1,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 50,
                            weight: 1,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            StyleVariables.sliverSizedBox(20),
            _isGridView==true
                ? SliverAnimatedGrid(
                    initialItemCount: 6,
                    itemBuilder: (context, index, _) {
                      return NoteCard(
                        bottom: 0,
                      );
                    },
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.3))
                : SliverAnimatedList(
                    initialItemCount: 6,
                    itemBuilder: (context, index, _) {
                      return NoteCard(
                        bottom: 10,
                      );
                    })
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          enableFeedback: true,
          onPressed: () {},
          child: Icon(Icons.add, size: 30),
          backgroundColor: ColorConstants.cardBGColorLight),
    );
  }
}
