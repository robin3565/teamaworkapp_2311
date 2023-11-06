class LatenessModel {
  final List<LatenessItem> list;

  LatenessModel({
    // required this.pageInfo,
    required this.list,
  });

  factory LatenessModel.fromJson(Map<String, dynamic> json) {
    return LatenessModel(
      // pageInfo: PageInfo.fromJson(json),
      list: (json['A_penalty'] as List<dynamic>?)
              ?.map((item) => LatenessItem.fromJson(item ?? {}))
              .toList() ??
          [],
    );
  }
}

class LatenessItem {
  String penaltyUid;
  String mTotLatecnt;
  String mTotSuspensionCnt;
  String mRemainSuspensionCnt;
  String mRemainPenaltyPrice;
  String mGivePenaltyPrice;
  String mTotPenaltyPrice;
  String targetMemuid;
  String memName;
  String memMoile;
  String teamName;
  String rankName;
  String positionName;
  String totRemainPenaltyPrice;
  String totGivePenaltyPrice;
  String totPenaltyPrice;

  LatenessItem({
    required this.penaltyUid,
    required this.mTotLatecnt,
    required this.mTotSuspensionCnt,
    required this.mRemainSuspensionCnt,
    required this.mRemainPenaltyPrice,
    required this.mGivePenaltyPrice,
    required this.mTotPenaltyPrice,
    required this.targetMemuid,
    required this.memName,
    required this.memMoile,
    required this.teamName,
    required this.rankName,
    required this.positionName,
    required this.totRemainPenaltyPrice,
    required this.totGivePenaltyPrice,
    required this.totPenaltyPrice,
  });

  factory LatenessItem.fromJson(Map<String, dynamic> json) {
    return LatenessItem(
      penaltyUid: json["penalty_uid"].toString(),
      mTotLatecnt: json["m_tot_late_cnt"].toString(),
      mTotSuspensionCnt: json["m_tot_suspension_cnt"].toString(),
      mRemainSuspensionCnt: json["m_remain_suspension_cnt"].toString(),
      mRemainPenaltyPrice: json["m_remain_penalty_price"].toString(),
      mGivePenaltyPrice: json["m_give_penalty_price"].toString(),
      mTotPenaltyPrice: json["m_tot_penalty_price"].toString(),
      targetMemuid: json["target_mem_uid"].toString(),
      memName: json["mem_name"].toString(),
      memMoile: json["mem_mobile"].toString(),
      teamName: json["team_name"].toString(),
      rankName: json["rank_name"].toString(),
      positionName: json["position_name"].toString(),
      totRemainPenaltyPrice: json["tot_remain_penalty_price"].toString(),
      totGivePenaltyPrice: json["tot_give_penalty_price"].toString(),
      totPenaltyPrice: json["tot_penalty_price"].toString(),
    );
  }
}
