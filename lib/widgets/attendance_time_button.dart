import 'package:flutter/material.dart';
import 'package:teama_work_app_new/styles/color_style.dart';

class TimeButton extends StatelessWidget {
  final String title;
  final String selectedTitle;
  final Function selectDateFun;

  const TimeButton({
    super.key,
    required this.title,
    required this.selectedTitle,
    required this.selectDateFun,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 66,
      child: IconButton(
        padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
        onPressed: () {
          selectDateFun(title);
        },
        icon: Container(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
            ),
            color: selectedTitle == title ? Colors.blue : Colors.white,
          ),
          child: Text(
            title,
            style: TextStyle(
              color:
                  selectedTitle == title ? Colors.white : ColorStyles.blueColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
