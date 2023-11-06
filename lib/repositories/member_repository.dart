import 'package:dio/dio.dart';
import 'package:teama_work_app_new/models/member.dart';

class MemberRepository {
  static const targetUrl = 'http://server.teama.company/auth/login';
  static final dio = Dio();

  // 로그인 시 데이터 호출
  static Future<Map<String, dynamic>> getMemberInfo(memId, memPw) async {
    final formData = {
      // 'os_type': osType,
      // 'device_id': deviceId,
      // 'app_version': appVersion,
      'login_id': memId,
      'login_pw': memPw,
      'is_postman': 'Y'
    };

    final response = await dio.post(
      targetUrl,
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    );

    if (response.statusCode == 200) {
      final responseData = response.data;
      final json_ = responseData;

      if (json_ != null && json_['result'] == 'OK') {
        final data_ = json_['data']['member'];
        final member = MemberModel.fromJson(data_);
        final memberUser = MemberUserModel(member: member);

        Map<String, dynamic> _result = {
          'login': true,
          'memModel': memberUser,
        };
        return _result;
      } else {
        Map<String, dynamic> _result = {
          'login': false,
          'err_msg': json_['err_msg'],
        };
        return _result;
      }
    }
    throw Exception('Failed to fetch member information');
  }
}
