class MemberUserModel {
  MemberModel member;

  MemberUserModel({
    required this.member,
  });
}

class MemberModel {
  final String memUid;
  final String regDate;
  final String regTime;
  final String regIp;
  final String regMemUid;
  final String memType;
  final String memId;
  final String encMemPw;
  final String encMemSalt;
  final String pwModDate;
  final String pwModTime;
  final String pwModMemUid;
  final String memName;
  final String memNickName;
  final String memEngName;
  final String memBirthday;
  final String employType;
  final String joinDate;
  final String outDate;
  final String memMobile;
  final String memEmail;
  final String address;
  final String teamUid;
  final String teamName;
  final String rankUid;
  final String rankName;
  final String positionUid;
  final String positionName;
  final String signFirstMemUid;
  final String signSecondMemUid;
  final String memPhoto;
  final String signImgUrl;
  final String employStatus;
  final String cateAuth;
  final String memo;
  final String cntLogin;
  final String attendTime;
  final String leaveTime;
  final String lastLoginDate;
  final String lastLoginTime;
  final String lastLoginIp;
  final String modDate;
  final String modTime;
  final String modMemUid;
  final String modIp;

  MemberModel({
    required this.memUid,
    required this.regDate,
    required this.regTime,
    required this.regIp,
    required this.regMemUid,
    required this.memType,
    required this.memId,
    required this.encMemPw,
    required this.encMemSalt,
    required this.pwModDate,
    required this.pwModTime,
    required this.pwModMemUid,
    required this.memName,
    required this.memNickName,
    required this.memEngName,
    required this.memBirthday,
    required this.employType,
    required this.joinDate,
    required this.outDate,
    required this.memMobile,
    required this.memEmail,
    required this.address,
    required this.teamUid,
    required this.teamName,
    required this.rankUid,
    required this.rankName,
    required this.positionUid,
    required this.positionName,
    required this.signFirstMemUid,
    required this.signSecondMemUid,
    required this.memPhoto,
    required this.signImgUrl,
    required this.employStatus,
    required this.cateAuth,
    required this.memo,
    required this.cntLogin,
    required this.attendTime,
    required this.leaveTime,
    required this.lastLoginDate,
    required this.lastLoginTime,
    required this.lastLoginIp,
    required this.modDate,
    required this.modTime,
    required this.modMemUid,
    required this.modIp,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      memUid: json['mem_uid'].toString(),
      regDate: json['reg_date'].toString(),
      regTime: json['reg_time'].toString(),
      regIp: json['reg_ip'].toString(),
      regMemUid: json['reg_mem_uid'].toString(),
      memType: json['mem_type'].toString(),
      memId: json['mem_id'].toString(),
      encMemPw: json['ENC_mem_pw'].toString(),
      encMemSalt: json['ENC_mem_salt'].toString(),
      pwModDate: json['pw_mod_date'].toString(),
      pwModTime: json['pw_mod_time'].toString(),
      pwModMemUid: json['pw_mod_mem_uid'].toString(),
      memName: json['mem_name'].toString(),
      memNickName: json['mem_nickname'].toString(),
      memEngName: json['mem_eng_name'].toString(),
      memBirthday: json['birth_date'].toString(),
      employType: json['employ_type'].toString(),
      joinDate: json['join_date'].toString(),
      outDate: json['out_date'].toString(),
      memMobile: json['mem_mobile'].toString(),
      memEmail: json['mem_email'].toString(),
      address: json['address'].toString(),
      teamUid: json['team_uid'].toString(),
      teamName: json['team_name'].toString(),
      rankUid: json['rank_uid'].toString(),
      rankName: json['rank_name'].toString(),
      positionUid: json['position_uid'].toString(),
      positionName: json['position_name'].toString(),
      signFirstMemUid: json['sign_first_mem_uid'].toString(),
      signSecondMemUid: json['sign_second_mem_uid'].toString(),
      memPhoto: json['profile_img_url'].toString(),
      signImgUrl: json['sign_img_url'].toString(),
      employStatus: json['employ_status'].toString(),
      cateAuth: json['cate_auth'].toString(),
      memo: json['memo'].toString(),
      cntLogin: json['cnt_login'].toString(),
      attendTime: json['attend_time'].toString(),
      leaveTime: json['leave_time'].toString(),
      lastLoginDate: json['last_login_date'].toString(),
      lastLoginTime: json['last_login_time'].toString(),
      lastLoginIp: json['last_login_ip'].toString(),
      modDate: json['mod_date'].toString(),
      modTime: json['mod_time'].toString(),
      modMemUid: json['mod_mem_uid'].toString(),
      modIp: json['mod_ip'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mem_uid': memUid,
      'reg_date': regDate,
      'reg_time': regTime,
      'reg_ip': regIp,
      'reg_mem_uid': regMemUid,
      'mem_type': memType,
      'mem_id': memId,
      'ENC_mem_pw': encMemPw,
      'ENC_mem_salt': encMemSalt,
      'pw_mod_date': pwModDate,
      'pw_mod_time': pwModTime,
      'pw_mod_mem_uid': pwModMemUid,
      'mem_name': memName,
      'mem_nickname': memNickName,
      'mem_eng_name': memEngName,
      'birth_date': memBirthday,
      'employ_type': employType,
      'join_date': joinDate,
      'out_date': outDate,
      'mem_mobile': memMobile,
      'mem_email': memEmail,
      'address': address,
      'team_uid': teamUid,
      'team_name': teamName,
      'rank_uid': rankUid,
      'rank_name': rankName,
      'position_uid': positionUid,
      'position_name': positionName,
      'sign_first_mem_uid': signFirstMemUid,
      'sign_second_mem_uid': signSecondMemUid,
      'profile_img_url': memPhoto,
      'sign_img_url': signImgUrl,
      'employ_status': employStatus,
      'cate_auth': cateAuth,
      'memo': memo,
      'cnt_login': cntLogin,
      'attend_time': attendTime,
      'leave_time': leaveTime,
      'last_login_date': lastLoginDate,
      'last_login_time': lastLoginTime,
      'last_login_ip': lastLoginIp,
      'mod_date': modDate,
      'mod_time': modTime,
      'mod_mem_uid': modMemUid,
      'mod_ip': modIp,
    };
  }
}
