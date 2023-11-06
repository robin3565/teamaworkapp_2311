import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teama_work_app_new/screens/login_screen.dart';
import 'package:teama_work_app_new/styles/color_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        moveScreen();
      },
    );
  }

  // 로그인 여부 확인
  Future<Map<String, dynamic>> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool autoLogin = prefs.getBool('autoLogin') ?? false;
    String? isMemberInfoJson = prefs.getString('isMemberInfo');

    Map<String, dynamic>? isMemberInfo =
        isMemberInfoJson != null ? jsonDecode(isMemberInfoJson) : null;

    Map<String, dynamic> info = {
      'autoLogin': autoLogin,
      'isMemberInfo': isMemberInfo
    };

    return info;
  }

  void moveScreen() async {
    await checkLogin().then((info) {
      // bool autoLogin = info['autoLogin'] ?? false;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
      // if (autoLogin) {
      //   _performAutoLogin();
      // } else {
      //   Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(
      //       builder: (context) => const LoginScreen(),
      //     ),
      //   );
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('splash');

    return Scaffold(
      body: Container(
        color: ColorStyles.basicColor,
        child: Center(
          child: Text('=='),
          // child: Image.asset(
          //   "assets/images/splash_logo.png",
          //   width: 80,
          // ),
        ),
      ),
    );
  }
}
