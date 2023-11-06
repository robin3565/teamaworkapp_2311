import 'package:teama_work_app_new/models/pageInfo.dart';

class AttendanceModel {
  final PageInfo pageInfo;
  final List<AttendanceItem> list;

  AttendanceModel({
    required this.pageInfo,
    required this.list,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      pageInfo: PageInfo.fromJson(json),
      list: (json['A_row'] as List<dynamic>?)
              ?.map((item) => AttendanceItem.fromJson(item ?? {}))
              .toList() ??
          [],
    );
  }
}

class AttendanceItem {
  String taskUid;
  String regDate;
  String regTime;
  String regMemUid;
  String attendUid;
  String signFirstMemUid;
  String signFirstFlag;
  String signFirstDatetime;
  String signSecondMemUid;
  String signSecondFlag;
  String signSecondDatetime;
  String attendDatetime;
  String leaveDatetime;
  String orderMemo;
  String requestMemo;
  String comment;
  String modDate;
  String modTime;
  String modMemUid;
  String memUid;
  String memType;
  String memName;
  String teamName;
  String rankName;
  String memMobile;
  String memEmail;
  String teamUid;
  String idxNum;
  String firstInfoName;
  String secondInfoName;
  String commentWriteFlag;
  String myFlag;
  String profile;

  AttendanceItem({
    required this.taskUid,
    required this.regDate,
    required this.regTime,
    required this.regMemUid,
    required this.attendUid,
    required this.signFirstMemUid,
    required this.signFirstFlag,
    required this.signFirstDatetime,
    required this.signSecondMemUid,
    required this.signSecondFlag,
    required this.signSecondDatetime,
    required this.attendDatetime,
    required this.leaveDatetime,
    required this.orderMemo,
    required this.requestMemo,
    required this.comment,
    required this.modDate,
    required this.modTime,
    required this.modMemUid,
    required this.memUid,
    required this.memType,
    required this.memName,
    required this.teamName,
    required this.rankName,
    required this.memMobile,
    required this.memEmail,
    required this.teamUid,
    required this.idxNum,
    required this.firstInfoName,
    required this.secondInfoName,
    required this.commentWriteFlag,
    required this.myFlag,
    required this.profile,
  });

  factory AttendanceItem.fromJson(Map<String, dynamic> json) {
    return AttendanceItem(
      taskUid: json["task_uid"].toString(),
      regDate: json["reg_date"].toString(),
      regTime: json["reg_time"].toString(),
      regMemUid: json["reg_mem_uid"].toString(),
      attendUid: json["attend_uid"].toString(),
      signFirstMemUid: json["sign_first_mem_uid"].toString(),
      signFirstFlag: json["sign_first_flag"].toString(),
      signFirstDatetime: json["sign_first_datetime"].toString(),
      signSecondMemUid: json["sign_second_mem_uid"].toString(),
      signSecondFlag: json["sign_second_flag"].toString(),
      signSecondDatetime: json["sign_second_datetime"].toString(),
      attendDatetime: json["attend_datetime"].toString(),
      leaveDatetime: json["leave_datetime"].toString(),
      orderMemo: json["order_memo"].toString(),
      requestMemo: json["request_memo"].toString(),
      comment: json["comment"].toString(),
      modDate: json["mod_date"].toString(),
      modTime: json["mod_time"].toString(),
      modMemUid: json["mod_mem_uid"].toString(),
      memUid: json["mem_uid"].toString(),
      memType: json["mem_type"].toString(),
      memName: json["mem_name"].toString(),
      teamName: json["team_name"].toString(),
      rankName: json["rank_name"].toString(),
      memMobile: json["mem_mobile"].toString(),
      memEmail: json["mem_email"].toString(),
      teamUid: json["team_uid"].toString(),
      idxNum: json["idx_num"].toString(),
      firstInfoName: json["first_info"]['name'].toString(),
      secondInfoName: json["second_info"]['name'].toString(),
      commentWriteFlag: json["comment_write_flag"].toString(),
      myFlag: json["my_flag"].toString(),
      profile:
          json["A_profile"].length > 0 ? json["A_profile"][0]['src_path'] : [],
    );
  }
}
