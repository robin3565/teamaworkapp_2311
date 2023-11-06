import 'package:flutter/material.dart';
import 'package:teama_work_app_new/models/notice.dart';
import 'package:teama_work_app_new/styles/color_style.dart';

class BoardListView extends StatelessWidget {
  final NoticeItem notice;
  final String type;
  const BoardListView({
    super.key,
    required this.notice,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160.0,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            notice.idxNum,
            style: TextStyle(
              color: ColorStyles.basicColor,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          Row(
            children: [
              Text(
                notice.regDate,
                style: TextStyle(
                  color: ColorStyles.memoColor,
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                notice.regTime,
                style: TextStyle(
                  color: ColorStyles.memoColor,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            notice.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ColorStyles.basicColor,
              fontSize: 17.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Text(
                notice.writerName,
                style: TextStyle(
                  color: ColorStyles.memoColor,
                  fontSize: 15.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
