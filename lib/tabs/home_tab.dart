import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teama_work_app_new/models/member.dart';
import 'package:teama_work_app_new/widgets/card_image.dart';
import 'package:teama_work_app_new/widgets/home_buttons.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  Future<MemberModel?> _getMemberInfo(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? memberInfoJson = prefs.getString('isMemberInfo');

    if (memberInfoJson != null) {
      Map<String, dynamic> memberInfoMap = jsonDecode(memberInfoJson);
      return MemberModel.fromJson(memberInfoMap);
    } else {
      return null;
    }
  }

  Widget _buildHomeTab(BuildContext context, MemberModel? memberInfo) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                top: -3,
                left: 0,
                child: Image.asset(
                  'assets/images/main_bg.png',
                  width: 300,
                ),
              ),
              CardImage(memberInfo: memberInfo!),
            ],
          ),
          SizedBox(
            child: HomeButtons(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MemberModel?>(
      future: _getMemberInfo(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Replace this with your desired loading widget
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          MemberModel? memberInfo = snapshot.data;
          if (memberInfo == null) {
            return Center(
              child: Text('사용자 정보가 없습니다.'),
            );
          }
          return _buildHomeTab(context, memberInfo);
        }
      },
    );
  }
}
