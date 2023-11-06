import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teama_work_app_new/screens/login_screen.dart';
import 'package:teama_work_app_new/styles/color_style.dart';
import 'package:teama_work_app_new/styles/text_style.dart';
import 'package:teama_work_app_new/tabs/dayoff_tab.dart';
import 'package:teama_work_app_new/tabs/home_tab.dart';
import 'package:teama_work_app_new/tabs/library_tab.dart';
import 'package:teama_work_app_new/tabs/notify_tab.dart';
import 'package:teama_work_app_new/tabs/work_tab.dart';
import 'package:teama_work_app_new/widgets/bottom_navigation.dart';
import 'package:teama_work_app_new/widgets/home_drawer_profile.dart';
import 'package:teama_work_app_new/widgets/menu_listtile.dart';
import 'package:teama_work_app_new/widgets/menu_listtile_2.dart';

class HomeScreen extends StatefulWidget {
  final int index;
  const HomeScreen({super.key, required this.index});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  // 초기화
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _currentIndex = widget.index ?? 0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void handleTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  } // 탭 이동

  final List<Widget> _tabs = [
    const HomeTab(),
    const NotifyTab(),
    const WorkTab(),
    const DayoffTab(),
    const LibraryTab()
  ]; // 탭 리스트

  @override
  Widget build(BuildContext context) {
    print('home!');
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
          child: GestureDetector(
            onTap: () {
              if (_currentIndex != 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(index: 0),
                  ),
                );
              }
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 35,
                  height: 35,
                ),
              ],
            ),
          ),
        ),
        actions: [
          LayoutBuilder(
            builder: (context, constraints) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openEndDrawer(); // Open the end drawer
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Image.asset(
                  'assets/images/btn_aside.png', // Replace with your custom aside menu image path
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: ColorStyles.basicColor,
      ),
      endDrawer: Drawer(
        child: ListView(
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
                      tabController: _tabController,
                      tabIndex: 0,
                      onTabSelected: handleTab,
                    ),
                    MenuListTile(
                      title: '공문',
                      tabController: _tabController,
                      tabIndex: 1,
                      onTabSelected: handleTab,
                    ),
                    MenuListTile(
                      title: '업무전달',
                      tabController: _tabController,
                      tabIndex: 2,
                      onTabSelected: handleTab,
                    ),
                    MenuListTile(
                      title: '잔여연차 조회',
                      tabController: _tabController,
                      tabIndex: 3,
                      onTabSelected: handleTab,
                    ),
                    const MenuListTile2(
                      title: '휴가원 보기',
                      routerName: '/dayoff',
                    ),
                    MenuListTile(
                      title: '자료실',
                      tabController: _tabController,
                      tabIndex: 4,
                      onTabSelected: handleTab,
                    ),
                    const Divider(
                      color: ColorStyles.dividerColor,
                    ),
                    const MenuListTile2(
                      title: '출근부',
                      routerName: '/attendance',
                    ),
                    const MenuListTile2(
                      title: '지각현황',
                      routerName: '/lateness',
                    ),
                    const Divider(
                      color: ColorStyles.dividerColor,
                    ),
                    ListTile(
                      title: Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '로그아웃',
                              style: TextStyles.basicText,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 1.5, 0),
                              child: Image.asset(
                                'assets/images/ico_logout.png',
                                width: 18,
                                height: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        // final _autoLogin =
                        //     await prefs.getBool('autoLogin') ?? false;
                        await prefs.clear();
                        // await prefs.setBool('autoLogin', _autoLogin);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: Container(
          height: 95,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ColorStyles.borderGrayColor.withOpacity(0.2),
                blurRadius: 15.0,
                offset: const Offset(0, 3),
                spreadRadius: 2,
              )
            ],
          ),
          child: BottomNavigation(
            currentIndex: _currentIndex,
            handleTab: handleTab,
          )),
    );
  }
}
