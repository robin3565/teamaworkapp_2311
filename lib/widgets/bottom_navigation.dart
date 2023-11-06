import 'package:flutter/material.dart';
import 'package:teama_work_app_new/styles/color_style.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) handleTab;
  const BottomNavigation({required this.currentIndex, required this.handleTab});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 0
                ? 'assets/images/menu01_on.png'
                : 'assets/images/menu01.png',
            width: 28,
            height: 28,
          ),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 1
                ? 'assets/images/menu02_on.png'
                : 'assets/images/menu02.png',
            width: 28,
            height: 28,
          ),
          label: '공문',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 2
                ? 'assets/images/menu03_on.png'
                : 'assets/images/menu03.png',
            width: 28,
            height: 28,
          ),
          label: '업무전달',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 3
                ? 'assets/images/menu04_on.png'
                : 'assets/images/menu04.png',
            width: 28,
            height: 28,
          ),
          label: '잔여연차',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            currentIndex == 4
                ? 'assets/images/menu05_on.png'
                : 'assets/images/menu05.png',
            width: 28,
            height: 28,
          ),
          label: '자료실',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorStyles.redColor,
      unselectedItemColor: ColorStyles.basicColor,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight
            .w600, // Set the default font weight for unselected labels
      ),
      currentIndex: currentIndex,
      onTap: (index) {
        handleTab(index);
      },
    );
  }
}
