import 'package:flutter/material.dart';
import 'package:qoway/ui/home/widgets/my_appbar.dart';
import 'package:qoway/ui/home/widgets/my_drawer.dart';

class HomeViewPhone extends StatelessWidget {
  HomeViewPhone({super.key, required this.userId});
  final String userId;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: Scaffold(
            key: scaffoldKey,
            drawer: const MyDrawer(),
            body: CustomScrollView(
              slivers: [
                const MyAppBar(),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Text(userId),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
