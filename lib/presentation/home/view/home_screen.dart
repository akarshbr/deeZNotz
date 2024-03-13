import 'package:deeznotz/core/constants/colors.dart';
import 'package:deeznotz/core/constants/style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                      Text("deeZNotz", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                      Spacer(),
                      IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.black, size: 50))
                    ],
                  ),
                ),
              ),
            ),
            StyleVariables.sliverSizedBox(20),
            SliverAnimatedGrid(
                initialItemCount: 6,
                itemBuilder: (context, index, _) {
                  return Container(
                    height: 100,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorConstants.cardBGColorLight),
                  );
                },
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 1.2))
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
