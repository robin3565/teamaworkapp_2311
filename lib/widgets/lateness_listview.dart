import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teama_work_app_new/models/lateness.dart';
import 'package:teama_work_app_new/styles/color_style.dart';

class LatenessListView extends StatelessWidget {
  final LatenessItem person;
  const LatenessListView({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    final krCurrency = NumberFormat.currency(locale: 'ko_KR', symbol: '');
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
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
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                person.teamName,
                style: TextStyle(
                  color: ColorStyles.memoColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    person.memName,
                    style: TextStyle(
                      color: ColorStyles.basicColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    person.positionName,
                    style: TextStyle(
                      color: ColorStyles.basicColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    person.mTotLatecnt,
                    style: TextStyle(
                      color: ColorStyles.borderGrayColor,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    person.mTotSuspensionCnt == '0'
                        ? ""
                        : '(+${person.mTotSuspensionCnt.toString()})',
                    style: TextStyle(
                      color: ColorStyles.borderGrayColor,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              const Divider(
                color: ColorStyles.dividerColor,
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '이달 벌금액',
                        style: TextStyle(
                          color: ColorStyles.basicColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${krCurrency.format(int.parse(person.totPenaltyPrice)).toString()}원',
                        style: TextStyle(
                          color: ColorStyles.basicColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '납부 벌금액',
                        style: TextStyle(
                          color: ColorStyles.basicColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              krCurrency
                                  .format(int.parse(person.totGivePenaltyPrice))
                                  .toString(),
                              style: TextStyle(
                                color: ColorStyles.blueColor,
                                fontSize: 18.0,
                              )),
                          Text(
                            '원',
                            style: TextStyle(
                              color: ColorStyles.basicColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '잔여 벌금액',
                        style: TextStyle(
                          color: ColorStyles.basicColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            krCurrency
                                .format(int.parse(person.totRemainPenaltyPrice))
                                .toString(),
                            style: TextStyle(
                              color: ColorStyles.redColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '원',
                            style: TextStyle(
                              color: ColorStyles.basicColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
