import 'package:flutter/material.dart';
import 'package:teama_work_app_new/models/member.dart';

class MemberProvider with ChangeNotifier {
  MemberModel? _memberInfo;
  MemberModel? get memberInfo => _memberInfo;

  void setMemberInfo(MemberModel? memberInfo) {
    _memberInfo = memberInfo;
    notifyListeners();
  }
}
