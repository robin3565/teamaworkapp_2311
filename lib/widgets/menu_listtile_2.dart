import 'package:flutter/material.dart';
import 'package:teama_work_app_new/styles/color_style.dart';
import 'package:teama_work_app_new/styles/text_style.dart';

class MenuListTile2 extends StatelessWidget {
  final String title;
  final String routerName;

  const MenuListTile2({
    super.key,
    required this.title,
    required this.routerName,
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
        Navigator.pushNamed(context, routerName);
      },
    );
  }
}
