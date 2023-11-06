import 'package:flutter/material.dart';
import 'package:teama_work_app_new/models/lateness.dart';
import 'package:teama_work_app_new/models/member.dart';
import 'package:teama_work_app_new/provider/member_provider.dart';
import 'package:teama_work_app_new/repositories/lateness_repository.dart';
import 'package:teama_work_app_new/styles/color_style.dart';
import 'package:teama_work_app_new/styles/text_style.dart';
import 'package:teama_work_app_new/widgets/attendance_time_button.dart';
import 'package:provider/provider.dart';
import 'package:teama_work_app_new/widgets/lateness_listview.dart';

class LatenessScreen extends StatefulWidget {
  const LatenessScreen({Key? key}) : super(key: key);

  @override
  _LatenessScreenState createState() => _LatenessScreenState();
}

class _LatenessScreenState extends State<LatenessScreen> {
  String? _selectedTitle; // 이달, 전달 버튼 설정값
  String? _selectedDate; // 상단 날짜 설정값

  Future<LatenessModel?>? _latenessModelFuture;

  // 무한 스크롤 설정 초기화
  List<LatenessItem> latenessItem = [];
  bool isLoading = false; // 로딩 여부 초기화
  int page = 1;
  final int pageSize = 10; // 페이지 사이즈
  int totalPage = 1; // 전체 페이지 사이즈

  // 시간 정보 초기화
  DateTime now = DateTime.now();
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  String formattedMonth = DateTime.now().month.toString().padLeft(2, '0');

  // 지각 정보 가져오기
  Future<LatenessModel?> getLatenessInfo(String fMonth, String fYear,
      {int page = 1}) async {
    print('a');
    print(fMonth);
    print(fYear);
    // MemberProvider memberProvider =
    //     Provider.of<MemberProvider>(context, listen: false);
    // MemberModel? memberInfo = memberProvider.memberInfo;
    // String deviceId = await getDeviceInfo();
    // String appVersion = await getAppVersion();
    // String osType = Platform.operatingSystem;

    final _latenessInfo = await LatenessRepository.getLatenessInfo(
      // osType,
      // deviceId,
      // appVersion,
      fMonth,
      fYear,
      page,
    );

    print(_latenessInfo);

    // 전체 페이지 값 저장
    // totalPage = _latenessInfo.pageInfo.totalPage;

    return _latenessInfo;
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
      final latenessData =
          await getLatenessInfo(formattedMonth, year.toString(), page: page);

      setState(() {
        latenessItem.addAll(latenessData?.list ?? []);
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

  void selectDate(String item) {
    setState(() {
      now = DateTime.now();
      year = now.year;
      month = now.month;

      // if (item == '이달') {
      //   formattedMonth = month.toString().padLeft(2, '0');
      //   _selectedDate = '$year.$formattedMonth';
      // }

      // if (item == '전달') {
      //   DateTime oneMonthAgo = DateTime(year, month - 1);
      //   String formattedOneMonthAgo =
      //       oneMonthAgo.month.toString().padLeft(2, '0');
      //   formattedMonth = formattedOneMonthAgo;
      //   _selectedDate = '$year.$formattedOneMonthAgo';
      // }

      _selectedTitle = item;
      // latenessItem.clear();
      // page = 1;
      // fetchMoreData();
    });
  }

  void selectIconDate(String type) {
    setState(() {
      if (type == 'prev') {
        final previousMonth = DateTime(year, month - 1);
        year = previousMonth.year;
        month = previousMonth.month;
        _selectedTitle = '이달';
        if (month < 1) {
          month = 12;
          year--;
        }
      } else if (type == 'next') {
        final nextMonth = DateTime(year, month + 1);
        if (nextMonth.isBefore(DateTime.now())) {
          year = nextMonth.year;
          month = nextMonth.month;
          _selectedTitle = '이달';

          if (month > 12) {
            month = 1;
            year++;
          }
        }
      }
      formattedMonth = month.toString().padLeft(2, '0');
      _selectedDate = '$year.$formattedMonth';
      latenessItem.clear();
      page = 1;
      fetchMoreData();
    });
  }

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    year = now.year;
    month = now.month;

    formattedMonth = month.toString().padLeft(2, '0');

    // 초기 설정값
    _selectedTitle = '이달';
    _selectedDate = '$year.$formattedMonth';

    fetchMoreData();
  }

  Widget buildNoDataWidget() {
    return const Center(
      child: Text(
        'No data',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: ColorStyles
                  .arrowIconColor, // Set the color of the back button to white
            ),
            onPressed: () {
              Navigator.pop(
                context,
              ); // Navigate back when the back button is pressed
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
          child: Center(
            child: Text(
              '지각현황 보기',
              style: TextStyles.appbarWhiteText,
            ),
          ),
        ),
        backgroundColor: ColorStyles.basicColor,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (!isLoading &&
                scrollNotification.metrics.pixels ==
                    scrollNotification.metrics.maxScrollExtent) {
              fetchMoreData();
            }
            return false;
          },
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(28, 40, 28, 28),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          selectIconDate('prev');
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                        ),
                      ),
                      Text(
                        '2023.11',
                        style: TextStyle(
                          color: ColorStyles.basicColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          selectIconDate('next');
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      TimeButton(
                          title: '이달',
                          selectedTitle: _selectedTitle!,
                          selectDateFun: selectDate),
                      TimeButton(
                          title: '전달',
                          selectedTitle: _selectedTitle!,
                          selectDateFun: selectDate),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (latenessItem.isEmpty)
                    buildNoDataWidget()
                  else
                    Container(
                      color: ColorStyles.backgroundColor,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: latenessItem.length,
                          itemBuilder: (context, index) {
                            final person = latenessItem[index];
                            return LatenessListView(person: person);
                          }),
                    )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
