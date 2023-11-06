import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teama_work_app_new/provider/member_provider.dart';
import 'package:teama_work_app_new/screens/attendance_screen.dart';
import 'package:teama_work_app_new/screens/lateness_screen.dart';
import 'package:teama_work_app_new/screens/login_screen.dart';
import 'package:teama_work_app_new/screens/splash_screen.dart';
import 'package:teama_work_app_new/styles/color_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    print('main!');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MemberProvider>(
          create: (context) => MemberProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'TeamA Work App',
        theme: ThemeData(
          colorScheme: const ColorScheme.light().copyWith(
            primary: ColorStyles.basicColor,
            onPrimary: ColorStyles.backgroundColor,
            primaryContainer: ColorStyles.backgroundColor,
            onPrimaryContainer: ColorStyles.basicColor,
            secondary: ColorStyles.basicColor,
            onSecondary: ColorStyles.backgroundColor,
            secondaryContainer: ColorStyles.backgroundColor,
            onSecondaryContainer: ColorStyles.basicColor,
            onError: ColorStyles.redColor,
            error: ColorStyles.backgroundColor,
            background: ColorStyles.backgroundColor,
            onBackground: ColorStyles.backgroundColor,
          ),
          dialogTheme: const DialogTheme(
            backgroundColor: Colors.white,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/attendance': (context) => const AttendanceScreen(),
          '/lateness': (context) => const LatenessScreen(),
        },
      ),
    );
  }
}
