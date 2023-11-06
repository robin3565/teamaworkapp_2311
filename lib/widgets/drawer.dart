import 'package:flutter/material.dart';
import 'package:teama_work_app_new/styles/color_style.dart';
import 'package:teama_work_app_new/widgets/home_drawer_profile.dart';
import 'package:teama_work_app_new/widgets/menu_listtile.dart';

class DrawerList extends StatelessWidget {
  final TabController tabController;
  final Function(int) handleTab;

  const DrawerList({
    Key? key,
    required this.tabController,
    required this.handleTab,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: ColorStyles.basicColor,
            borderRadius: BorderRadius.zero,
          ),
          child: HomeDrawerProfile(),
        ),
        Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height - 200,
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MenuListTile(
                    title: 'HOME',
                    tabController: tabController,
                    tabIndex: 0,
                    onTabSelected: handleTab,
                  ),
                  MenuListTile(
                    title: '공문',
                    tabController: tabController,
                    tabIndex: 1,
                    onTabSelected: handleTab,
                  ),
                  MenuListTile(
                    title: '업무전달',
                    tabController: tabController,
                    tabIndex: 2,
                    onTabSelected: handleTab,
                  ),
                  MenuListTile(
                    title: '잔여연차 조회',
                    tabController: tabController,
                    tabIndex: 3,
                    onTabSelected: handleTab,
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
