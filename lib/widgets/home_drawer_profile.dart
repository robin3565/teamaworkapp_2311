import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teama_work_app_new/models/member.dart';
import 'package:teama_work_app_new/provider/member_provider.dart';
import 'package:teama_work_app_new/styles/color_style.dart';

class HomeDrawerProfile extends StatelessWidget {
  const HomeDrawerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    MemberProvider memberProvider = Provider.of<MemberProvider>(context);
    MemberModel? memberInfo = memberProvider.memberInfo;

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(22, 0, 15, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              border: Border.all(
                color: ColorStyles.arrowIconColor,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: memberInfo?.memPhoto != ''
                  ? Image.network(
                      memberInfo?.memPhoto ?? '',
                      width: 78,
                      height: 78,
                    )
                  : Image.asset(
                      'assets/images/splash_logo.png',
                      width: 78,
                      height: 78,
                    ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    memberInfo?.teamName ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    memberInfo?.positionName ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                memberInfo?.memName ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
