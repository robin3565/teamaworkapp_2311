import 'package:flutter/material.dart';
import 'package:teama_work_app_new/styles/color_style.dart';
import 'package:teama_work_app_new/styles/text_style.dart';

class MenuListTile extends StatelessWidget {
  final String title;
  final TabController tabController;
  final int tabIndex;
  final Function(int) onTabSelected;

  const MenuListTile({
    super.key,
    required this.title,
    required this.tabController,
    required this.tabIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyles.basicText,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: ColorStyles.arrowIconColor,
              size: 18,
            )
          ],
        ),
      ),
      onTap: () {
        tabController.animateTo(tabIndex); // Tab 화면 이동
        onTabSelected(tabIndex); // Tab 이동
        Navigator.pop(context); // drawer 닫기
      },
    );
  }
}
