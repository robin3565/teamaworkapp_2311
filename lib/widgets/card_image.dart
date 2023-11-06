import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:teama_work_app_new/models/member.dart';
import 'package:teama_work_app_new/styles/color_style.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CardImage extends StatefulWidget {
  final MemberModel memberInfo;

  const CardImage({
    Key? key,
    required this.memberInfo,
  });

  @override
  State<CardImage> createState() => _CardImageState();
}

class _CardImageState extends State<CardImage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      side: CardSide.FRONT,
      front: Padding(
        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Center(
          child: Stack(
            children: [
              Image.asset(
                'assets/images/card_front.png',
                width: 300,
              ),
              Positioned(
                top: 23,
                right: 23,
                child: QrImageView(
                  data: 'teama/${widget.memberInfo.memUid}', // teama/memuid
                  version: QrVersions.min,
                  size: 80.0,
                ),
              ),
              Positioned(
                bottom: 100,
                left: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                          color: ColorStyles.arrowIconColor,
                        ),
                      ),
                      child: widget.memberInfo.memPhoto != ''
                          ? Image.network(
                              widget.memberInfo.memPhoto,
                              width: 110,
                              height: 110,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/login_logo.png',
                              width: 100,
                              height: 100,
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${widget.memberInfo.teamName}',
                              style: TextStyle(
                                color: ColorStyles.memoColor,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              widget.memberInfo.positionName,
                              style: TextStyle(
                                color: ColorStyles.memoColor,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.memberInfo.memName,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        // Text(
                        //   '영어 이름',
                        //   style: const TextStyle(
                        //     color: ColorStyles.memoColor,
                        //     fontSize: 16,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 30,
                left: 85,
                child: Image.asset(
                  'assets/images/logo_black_sm.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
      back: Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Center(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/qr_back.png',
                  width: 300,
                ),
                Positioned(
                  top: 25,
                  left: 18,
                  child: Text(
                    '출퇴근 QR',
                    style: TextStyle(
                      color: ColorStyles.memoColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  right: 25,
                  child: Image.asset(
                    'assets/images/logo_black_sm.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                Positioned(
                  top: 80,
                  right: 53,
                  child: Column(
                    children: [
                      QrImageView(
                        data: 'teama/${widget.memberInfo.memUid}',
                        version: QrVersions.min,
                        size: 200.0,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.memberInfo.teamName,
                            style: TextStyle(
                              color: ColorStyles.memoColor,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            widget.memberInfo.positionName,
                            style: TextStyle(
                              color: ColorStyles.memoColor,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.memberInfo.memName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 6.0,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
