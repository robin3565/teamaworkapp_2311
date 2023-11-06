import 'package:flutter/material.dart';
import 'package:teama_work_app_new/styles/color_style.dart';

class CustomAlertDialog extends StatelessWidget {
  final String errMsg;

  const CustomAlertDialog({required this.errMsg});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        '알림',
        style: TextStyle(
          color: ColorStyles.basicColor,
        ),
      ),
      backgroundColor: Colors.white,
      content: Text(errMsg),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            '확인',
            style: TextStyle(
              color: ColorStyles.basicColor,
            ),
          ),
        ),
      ],
    );
  }
}
