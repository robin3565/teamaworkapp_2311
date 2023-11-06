import 'package:teama_work_app_new/models/pageInfo.dart';

class NoticeModel {
  final PageInfo pageInfo;
  final List<NoticeItem> list;

  NoticeModel({
    required this.pageInfo,
    required this.list,
  });
  factory NoticeModel.fromJson(Map<String, dynamic> json) {
    return NoticeModel(
      pageInfo: PageInfo.fromJson(json),
      list: (json['A_board'] as List<dynamic>?)
              ?.map((item) => NoticeItem.fromJson(item ?? {}))
              .toList() ??
          [],
    );
  }
}

class NoticeItem {
  String boardUid;
  String regDate;
  String regTime;
  String regMemUid;
  String reqIp;
  String boardType;
  String writerId;
  String writerName;
  String writerMobile;
  String title;
  String summary;
  String contents;
  String linkUrl;
  String chkNotice;
  String viewCnt;
  String replyStatus;
  String replyWriterId;
  String replyWriterName;
  String replyWriterContents;
  String replyDate;
  String replyTime;
  String replyMemUid;
  String modDate;
  String modTime;
  String modMemUid;
  String modIp;
  String idxNum;
  String cmtCnt;
  String fileFlag;

  NoticeItem({
    required this.boardUid,
    required this.regDate,
    required this.regTime,
    required this.regMemUid,
    required this.reqIp,
    required this.boardType,
    required this.writerId,
    required this.writerName,
    required this.writerMobile,
    required this.title,
    required this.summary,
    required this.contents,
    required this.linkUrl,
    required this.chkNotice,
    required this.viewCnt,
    required this.replyStatus,
    required this.replyWriterId,
    required this.replyWriterName,
    required this.replyWriterContents,
    required this.replyDate,
    required this.replyTime,
    required this.replyMemUid,
    required this.modDate,
    required this.modTime,
    required this.modMemUid,
    required this.modIp,
    required this.idxNum,
    required this.cmtCnt,
    required this.fileFlag,
  });

  factory NoticeItem.fromJson(Map<String, dynamic> json) {
    return NoticeItem(
      boardUid: json['board_uid'].toString(),
      regDate: json['reg_date'].toString(),
      regTime: json['reg_time'].toString(),
      regMemUid: json['reg_mem_uid'].toString(),
      reqIp: json['reg_ip'].toString(),
      boardType: json['board_type'].toString(),
      writerId: json['writer_id'].toString(),
      writerName: json['writer_name'].toString(),
      writerMobile: json['writer_mobile'].toString(),
      title: json['title'].toString(),
      summary: json['summary'].toString(),
      contents: json['contents'].toString(),
      linkUrl: json['link_url'].toString(),
      chkNotice: json['chk_notice'].toString(),
      viewCnt: json['view_cnt'].toString(),
      replyStatus: json['reply_status'].toString(),
      replyWriterId: json['reply_writer_id'].toString(),
      replyWriterName: json['reply_writer_name'].toString(),
      replyWriterContents: json['reply_writer_contents'].toString(),
      replyDate: json['reply_date'].toString(),
      replyTime: json['reply_time'].toString(),
      replyMemUid: json['reply_mem_uid'].toString(),
      modDate: json['mod_date'].toString(),
      modTime: json['mod_time'].toString(),
      modMemUid: json['mod_mem_uid'].toString(),
      modIp: json['mod_ip'].toString(),
      idxNum: json['idx_num'].toString(),
      cmtCnt: json['cmt_cnt'].toString(),
      fileFlag: json['file_flag'].toString(),
    );
  }
}
