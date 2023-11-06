import 'package:flutter/material.dart';
import 'package:teama_work_app_new/models/dayoff.dart';
import 'package:teama_work_app_new/styles/color_style.dart';

class DayoffListView extends StatelessWidget {
  final DayOffItem dayoffData;
  const DayoffListView({
    super.key,
    required this.dayoffData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: ColorStyles.borderGrayColor.withOpacity(0.2),
            blurRadius: 10.0,
            offset: const Offset(0, 2),
            spreadRadius: 1.2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dayoffData.teamName ?? '',
            style: TextStyle(
              color: ColorStyles.memoColor,
              fontSize: 17.0,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Text(
                dayoffData.memName ?? '',
                style: TextStyle(
                  color: ColorStyles.basicColor,
                  fontSize: 23.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                dayoffData.positionName ?? '',
                style: TextStyle(
                  color: ColorStyles.basicColor,
                  fontSize: 23.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const Divider(
            color: ColorStyles.dividerColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '발생연차',
                style: TextStyle(
                  color: ColorStyles.basicColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${dayoffData.createCnt}일',
                style: TextStyle(
                  color: ColorStyles.basicColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '추가일수',
                style: TextStyle(
                  color: ColorStyles.basicColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${dayoffData.addCnt}일',
                style: TextStyle(
                  color: ColorStyles.basicColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '공제일수',
                style: TextStyle(
                  color: ColorStyles.basicColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${dayoffData.minusCnt}일',
                style: TextStyle(
                  color: ColorStyles.basicColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '총 연차',
                style: TextStyle(
                  color: ColorStyles.basicColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${dayoffData.totalCnt}일',
                style: TextStyle(
                  color: ColorStyles.basicColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '사용일수',
                style: TextStyle(
                  color: ColorStyles.basicColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${dayoffData.useCnt}일',
                style: TextStyle(
                  color: const Color.fromARGB(255, 77, 54, 54),
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '잔여연차',
                style: TextStyle(
                  color: ColorStyles.basicColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/ico_notice_red.png',
                    width: 16.0,
                    height: 16.0,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${dayoffData.remainCnt}일',
                    style: TextStyle(
                      color: ColorStyles.redColor,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Divider(
            color: ColorStyles.dividerColor,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              '${dayoffData.applySdate}~${dayoffData.applyEdate}',
              style: TextStyle(
                color: ColorStyles.memoColor,
                fontSize: 17.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
