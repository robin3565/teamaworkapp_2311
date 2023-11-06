import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teama_work_app_new/models/dayoff.dart';
import 'package:teama_work_app_new/models/member.dart';
import 'package:teama_work_app_new/provider/member_provider.dart';
import 'package:teama_work_app_new/repositories/dayoff_repository.dart';
import 'package:teama_work_app_new/styles/color_style.dart';
import 'package:teama_work_app_new/styles/text_style.dart';
import 'package:teama_work_app_new/widgets/dayoff_listview.dart';

class DayoffTab extends StatefulWidget {
  const DayoffTab({super.key});

  @override
  _DayoffTabState createState() => _DayoffTabState();
}

class _DayoffTabState extends State<DayoffTab> {
  // 무한 스크롤 설정 초기화
  bool isLoading = false; // 로딩 여부 초기화
  int page = 1; // 현재 페이지
  final int pageSize = 10; // 페이지 사이즈
  int totalPage = 1; // 전체 페이지 사이즈

  // 무한 스크롤 이벤트 초기화
  List<DayOffItem> dayoffItems = [];
  String _dayOffModeDate = '';
  Future<DayOffModel?>? _dayoffModelFuture;

  MemberModel? memberInfo; // 로그인 시 저장되는 정보

  Future<DayOffModel?> getDayoffInfo() async {
    MemberProvider memberProvider =
        Provider.of<MemberProvider>(context, listen: false);
    memberInfo = memberProvider.memberInfo;

    // String deviceId = await getDeviceInfo();
    // String appVersion = await getAppVersion();
    // String osType = Platform.operatingSystem;

    final dayoffInfo = await DayOffRepository.getDayoffInfo(
      page: page,
    );

    totalPage = dayoffInfo.pageInfo.totalPage;

    return dayoffInfo;
  }

  // 무한 스크롤 이벤트
  Future<void> fetchMoreData() async {
    if (isLoading) return;

    if (totalPage < page) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final dayoffData = await getDayoffInfo();

      setState(() {
        dayoffItems.addAll(dayoffData?.list ?? []);
        page++;
      });
    } catch (error) {
      print('Error fetching attendance data: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMoreData();
    _dayoffModelFuture = getDayoffInfo();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _dayoffModelFuture,
        builder: (context, snapshot) {
          final dayoffModel = snapshot.data;
          final dayoffDataList = dayoffModel?.list ?? [];
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(28.0),
              color: ColorStyles.backgroundColor,
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dayoffItems.length,
                      itemBuilder: (context, index) {
                        final dayoffData = dayoffItems[index];
                        return DayoffListView(
                          dayoffData: dayoffData,
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 8),
                      child: Divider(
                        color: ColorStyles.dividerColor,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '유의사항',
                          style: TextStyles.thirdtitleText,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              '· [',
                              style: TextStyle(
                                color: ColorStyles.basicColor,
                                fontSize: 15.0,
                              ),
                            ),
                            Text(
                              dayoffDataList.isEmpty
                                  ? ''
                                  : dayoffDataList[0].applyEdate,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 13.5),
                            ),
                            Text(
                              '] 기준 휴가원',
                              style: TextStyle(
                                color: ColorStyles.basicColor,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          '· 잔여연차 갱신일 : 매월 16일 (휴일 또는 업무상 1~2일 밀릴 수 있음)',
                          style: TextStyle(
                            color: ColorStyles.basicColor,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          '· 상기 날짜 이후 사용예정 휴가는 ERP에 등록하였더라도 휴가일에 도달해야 차감 반영 (본인 별도 계산 필요)',
                          style: TextStyle(
                            color: ColorStyles.basicColor,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          '· 징검다리 휴가, 추가,공제, 오류 등으로 본인 계산 일수와 ERP상 일수의 차이가 발생 할 수 있음.',
                          style: TextStyle(
                            color: ColorStyles.basicColor,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          '· 퇴직 예정일 1개월 이내 또는 잔여연차 3일 이하일 경우에만 총무팀에 문의해 잔여연차 개별문의 가능. (이외엔 ERP 내 정기 잔여연차 갱신시에만 확인 가능)',
                          style: TextStyle(
                            color: ColorStyles.basicColor,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          '· 그 외 자세한 사항은 총무팀에 문의하세요.',
                          style: TextStyle(
                            color: ColorStyles.basicColor,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
