import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teama_work_app_new/models/attendance.dart';
import 'package:teama_work_app_new/styles/color_style.dart';

class AttendanceListView extends StatelessWidget {
  final AttendanceItem person;
  const AttendanceListView({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: ColorStyles.arrowIconColor,
                      width: 0.8,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl: person.profile,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        person.memName,
                        style: TextStyle(
                          color: ColorStyles.basicColor,
                          fontSize: 21.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        person.rankName,
                        style: TextStyle(
                          color: ColorStyles.basicColor,
                          fontSize: 21.0,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '근무일지 작성',
                        style: TextStyle(
                          color: ColorStyles.memoColor,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Image.asset(
                        'assets/images/ico_o.png',
                        width: 15,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Divider(color: ColorStyles.dividerColor),
          Row(
            children: [
              Text(
                '출근',
                style: TextStyle(
                  color: ColorStyles.basicColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                person.attendDatetime,
                style: TextStyle(
                  color: ColorStyles.memoColor,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '퇴근',
                style: TextStyle(
                  color: ColorStyles.basicColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                person.leaveDatetime,
                style: TextStyle(
                  color: ColorStyles.memoColor,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
