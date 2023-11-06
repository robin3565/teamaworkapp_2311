import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teama_work_app_new/models/member.dart';
import 'package:teama_work_app_new/models/notice.dart';
import 'package:teama_work_app_new/models/pageInfo.dart';
import 'package:teama_work_app_new/provider/member_provider.dart';
import 'package:teama_work_app_new/repositories/notice_repository.dart';
import 'package:teama_work_app_new/widgets/board_listview.dart';

class NotifyTab extends StatefulWidget {
  const NotifyTab({super.key});

  @override
  _NotifyTabState createState() => _NotifyTabState();
}

class _NotifyTabState extends State<NotifyTab> {
  // 초기화
  ScrollController _scrollController = ScrollController();
  Future<NoticeModel?>? _noticeModelFuture;
  List<NoticeItem> _filteredNoticeInfo = [];
  PageInfo? pageInfo;
  int? totalPage = 0;

  int _currentPage = 1;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _noticeModelFuture = getNoticeInfo();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  // 공문 데이터 불러오기
  Future<NoticeModel?> getNoticeInfo({int page = 1}) async {
    MemberProvider memberProvider =
        Provider.of<MemberProvider>(context, listen: false);
    MemberModel? memberInfo = memberProvider.memberInfo;

    // String deviceId = await getDeviceInfo();
    // String appVersion = await getAppVersion();
    // String osType = Platform.operatingSystem;

    final noticeInfo = await NoticeRepository.getNoticeInfo(
      // osType,
      // deviceId,
      // appVersion,
      memberInfo?.memUid,
      'notice',
      10,
      page,
    );

    return noticeInfo;
  }

  // 무한 스크롤 이벤트
  Future<void> _loadMoreData() async {
    try {
      setState(() {
        _isLoadingMore = true;
      });

      final noticeModel = await getNoticeInfo(page: _currentPage + 1);
      final newNoticeData = noticeModel?.list ?? [];
      pageInfo = noticeModel?.pageInfo;
      totalPage = int.parse(pageInfo?.totalPage.toString() ?? '0');

      if (_currentPage < (totalPage ?? 0)) {
        setState(() {
          _filteredNoticeInfo.addAll(newNoticeData);
          _currentPage++;
          _isLoadingMore = false;
        });
      } else {
        setState(() {
          _isLoadingMore = false;
        });
      }
    } catch (error) {
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!_isLoadingMore) {
        _loadMoreData();
      }
    }
  }

  // 리프레시 이벤트
  Future<void> _handleRefresh() async {
    try {
      final noticeModel = await getNoticeInfo(page: 1);
      final newNoticeData = noticeModel?.list ?? [];

      setState(() {
        _filteredNoticeInfo = newNoticeData;
        _currentPage = 1;
      });
    } catch (error) {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NoticeModel?>(
        future: _noticeModelFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 450,
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('오류 발생: ${snapshot.error}'));
          } else {
            final noticeModel = snapshot.data;
            final noticeData = noticeModel?.list ?? [];

            if (_filteredNoticeInfo.isEmpty) {
              _filteredNoticeInfo = noticeData;
            }
            if (_filteredNoticeInfo.isEmpty) {
              return const SizedBox(
                height: 150,
                child: Center(
                  child: Text(
                    'No Data',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: _handleRefresh,
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                  controller: _scrollController,
                  itemCount:
                      _filteredNoticeInfo.length + (_isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < _filteredNoticeInfo.length) {
                      final notice = _filteredNoticeInfo[index];
                      return BoardListView(
                        notice: notice,
                        type: "notice",
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}
