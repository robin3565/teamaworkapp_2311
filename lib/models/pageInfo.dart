class PageInfo {
  final int totalCnt;
  final int nowPage;
  final int totalPage;
  final int pageSize;

  PageInfo({
    required this.totalCnt,
    required this.nowPage,
    required this.totalPage,
    required this.pageSize,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
      totalCnt: int.parse(json['total_cnt'].toString()),
      nowPage: int.parse(json['now_page'].toString()),
      totalPage: int.parse(json['total_page'].toString()),
      pageSize: int.parse(json['page_size'].toString()),
    );
  }
}
