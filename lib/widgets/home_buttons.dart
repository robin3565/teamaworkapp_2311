import 'package:flutter/material.dart';
import 'package:teama_work_app_new/styles/color_style.dart';

class HomeButtons extends StatelessWidget {
  const HomeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/attendance');
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              Size(170, 55.0),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorStyles.redColor),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ico_cal.png',
                width: 21.0,
              ),
              const SizedBox(width: 10),
              Text(
                '출근부 보기',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              )
            ],
          ),
        ),
        SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/lateness');
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              Size(170, 55),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorStyles.basicColor),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ico_late.png',
                width: 21,
              ),
              const SizedBox(width: 10),
              Text(
                '지각현황 보기',
                style: TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
