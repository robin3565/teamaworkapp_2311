import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 3.0,
      right: 3,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/lateness');
        },
        child: Image.asset(
          'assets/images/btn_page_link.png',
          width: 45.0,
          height: 45.0,
        ),
      ),
    );
  }
}
