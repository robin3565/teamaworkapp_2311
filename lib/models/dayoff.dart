import 'package:teama_work_app_new/models/pageInfo.dart';

class DayOffModel {
  final PageInfo pageInfo;
  final List<DayOffItem> list;

  DayOffModel({
    required this.pageInfo,
    required this.list,
  });

  factory DayOffModel.fromJson(Map<String, dynamic> json) {
    return DayOffModel(
      pageInfo: PageInfo.fromJson(json),
      list: (json['A_vacation_data'] as List<dynamic>?)
              ?.map((item) => DayOffItem.fromJson(item ?? {}))
              .toList() ??
          [],
    );
  }
}

class DayOffItem {
  final String vacatioDataUid;
  final String regDate;
  final String regTime;
  final String regMemUid;
  final String memName;
  final String teamName;
  final String positionName;
  final String applySdate;
  final String applyEdate;
  final String createCnt;
  final String addCnt;
  final String lessCnt;
  final String totalCnt;
  final String useCnt;
  final String minusCnt;
  final String remainCnt;
  final String modDate;
  final String modTime;
  final String modMemUid;
  final String idxNum;

  DayOffItem({
    required this.vacatioDataUid,
    required this.regDate,
    required this.regTime,
    required this.regMemUid,
    required this.memName,
    required this.teamName,
    required this.positionName,
    required this.applySdate,
    required this.applyEdate,
    required this.createCnt,
    required this.addCnt,
    required this.lessCnt,
    required this.totalCnt,
    required this.useCnt,
    required this.minusCnt,
    required this.remainCnt,
    required this.modDate,
    required this.modTime,
    required this.modMemUid,
    required this.idxNum,
  });

  factory DayOffItem.fromJson(Map<String, dynamic> json) {
    return DayOffItem(
      vacatioDataUid: json["vacation_data_uid"].toString(),
      regDate: json["reg_date"].toString(),
      regTime: json["reg_time"].toString(),
      regMemUid: json["reg_mem_uid"].toString(),
      memName: json["mem_name"].toString(),
      teamName: json["team_name"].toString(),
      positionName: json["position_name"].toString(),
      applySdate: json["apply_sdate"].toString(),
      applyEdate: json["apply_edate"].toString(),
      createCnt: json["create_cnt"].toString(),
      addCnt: json["add_cnt"].toString(),
      lessCnt: json["less_cnt"].toString(),
      totalCnt: json["total_cnt"].toString(),
      useCnt: json["use_cnt"].toString(),
      minusCnt: json["minus_cnt"].toString(),
      remainCnt: json["remain_cnt"].toString(),
      modDate: json["mod_date"].toString(),
      modTime: json["mod_time"].toString(),
      modMemUid: json["mod_mem_uid"].toString(),
      idxNum: json["idx_num"].toString(),
    );
  }
}
