import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teama_work_app_new/models/attendance.dart';
import 'package:teama_work_app_new/models/member.dart';
import 'package:teama_work_app_new/provider/member_provider.dart';
import 'package:teama_work_app_new/repositories/attendance_repository.dart';
import 'package:teama_work_app_new/styles/color_style.dart';
import 'package:teama_work_app_new/styles/text_style.dart';
import 'package:teama_work_app_new/widgets/attendance_listview.dart';
import 'package:teama_work_app_new/widgets/attendance_next_button.dart';
import 'package:teama_work_app_new/widgets/attendance_time_button.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  String? selectedTeam; // 드롭다운 박스 설정값
  String? _selectedTitle; // 오늘, 어제, 전달, 이달 버튼 설정값
  String? _selectedDate = ''; // 상단 날짜 설정값
  MemberModel? memberInfo; // 로그인 시 저장되는 정보

  // 무한 스크롤 설정 초기화
  List<AttendanceItem> attendanceItems = []; // 출석 정보 리스트 초기화
  bool isLoading = false; // 로딩 여부 초기화
  int page = 1; // 현재 페이지
  final int pageSize = 10; // 페이지 사이즈
  int totalPage = 1; // 전체 페이지 사이즈

  // 날짜 설정 초기화
  DateTime now = DateTime.now();
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  String formattedDay = DateTime.now().day.toString().padLeft(2, '0');
  String formattedMonth = DateTime.now().month.toString().padLeft(2, '0');

  // 출석 정보 가져오기 이벤트
  Future<AttendanceModel?> getAttendanceInfo(String fDate,
      {String teamMemUid = '', int page = 1}) async {
    // String deviceId = await getDeviceInfo();
    // String appVersion = await getAppVersion();
    // String osType = Platform.operatingSystem;

    final _attendanceInfo =
        await AttendanceRepository.getAttendanceInfo(findEdate: fDate);

    // 전체 페이지 값 저장
    totalPage = _attendanceInfo.pageInfo.totalPage;

    return _attendanceInfo;
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
      final attendanceData = await getAttendanceInfo(_selectedDate ?? '',
          teamMemUid: selectedTeam ?? '', page: page);

      print(attendanceData);
      setState(() {
        attendanceItems.addAll(attendanceData?.list ?? []);
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

  void selectTeamName(String teamMemUid) {
    setState(() {
      selectedTeam = teamMemUid;
      // 버튼 클릭 시 기존 데이터 초기화
      attendanceItems.clear();
      page = 1;
      fetchMoreData(); // Fetch new attendance data
    });
  }

  Future<void> _handleRefresh() async {
    try {
      final attendanceData = await getAttendanceInfo(_selectedTitle ?? '오늘',
          teamMemUid: selectedTeam ?? '', page: 1);

      setState(() {
        attendanceItems = attendanceData?.list ?? [];
        page = 1;
      });
    } catch (error) {
      // Handle error if needed
    }
  }

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    year = now.year;
    month = now.month;
    day = now.day;

    formattedMonth = month.toString().padLeft(2, '0');
    formattedDay = day.toString().padLeft(2, '0');
    _selectedDate = '$year-$formattedMonth-$formattedDay';

    selectedTeam = null;
    _selectedTitle = '오늘';

    MemberProvider memberProvider =
        Provider.of<MemberProvider>(context, listen: false);
    memberInfo = memberProvider.memberInfo;

    fetchMoreData();
  }

  void selectDate(String item) {
    setState(() {
      if (item == '오늘') {
        _selectedDate = '$year-$formattedMonth-$formattedDay';
      }
      if (item == '어제') {
        DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
        String formattedYesterday = yesterday.day.toString().padLeft(2, '0');
        _selectedDate = '$year-$formattedMonth-$formattedYesterday';
      }
      if (item == '이달') {
        int formattedDay = DateTime(now.year, now.month + 1, 0).day;
        _selectedDate = '$year-$formattedMonth-$formattedDay';
      }
      if (item == '전달') {
        DateTime oneMonthAgo = DateTime(year, month - 1);
        int formattedOneMonthAgo = oneMonthAgo.month;
        int formattedDay = DateTime(now.year, formattedOneMonthAgo + 1, 0).day;
        _selectedDate = '$year-$formattedOneMonthAgo-$formattedDay';
      }

      _selectedTitle = item;
      selectedTeam = null;

      attendanceItems.clear(); // Clear existing data
      page = 1; // Reset page number
      fetchMoreData(); // Fetch new attendance data
    });
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
                color: ColorStyles.arrowIconColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
            child: Center(
              child: Text(
                '출근부 보기',
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
            child: RefreshIndicator(
              onRefresh: _handleRefresh,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(23.0),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          memberInfo?.teamName ?? '',
                                          style: TextStyle(
                                            color: ColorStyles.basicColor,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          _selectedDate ?? '',
                                          style: TextStyle(
                                            color: ColorStyles.memoColor,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Row(
                                children: [
                                  TimeButton(
                                    title: '오늘',
                                    selectedTitle: _selectedTitle!,
                                    selectDateFun: selectDate,
                                  ),
                                  TimeButton(
                                    title: '어제',
                                    selectedTitle: _selectedTitle!,
                                    selectDateFun: selectDate,
                                  ),
                                  TimeButton(
                                    title: '전달',
                                    selectedTitle: _selectedTitle!,
                                    selectDateFun: selectDate,
                                  ),
                                  TimeButton(
                                    title: '이달',
                                    selectedTitle: _selectedTitle!,
                                    selectDateFun: selectDate,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          NextButton(),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 12, 0, 18),
                        padding: const EdgeInsets.fromLTRB(15, 2, 10, 2),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: ColorStyles.arrowIconColor,
                            width: 1.0,
                          ),
                        ),
                        child: DropdownButton<String?>(
                          value: 'all',
                          items: [
                            DropdownMenuItem<String?>(
                              value: 'all',
                              child: Text(
                                '전체',
                                style: TextStyle(
                                  color: ColorStyles.basicColor,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              selectTeamName(value!);
                            });
                          },
                          underline: const SizedBox(),
                          isExpanded: true,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 32,
                            color: ColorStyles.basicColor,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: attendanceItems.length,
                        itemBuilder: (context, index) {
                          final person = attendanceItems[index];
                          return AttendanceListView(person: person);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
