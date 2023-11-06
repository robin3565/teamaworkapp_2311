import 'package:dio/dio.dart';
import 'package:teama_work_app_new/models/attendance.dart';

class AttendanceRepository {
  static final targetUrl = 'http://server.teama.company/attend/task_list';
  static final dio = Dio();

  static Future<AttendanceModel> getAttendanceInfo(
      {String findEdate = ""}) async {
    final formData = {
      'is_postman': 'Y',
      'first_flag': 'Y',
    };

    final response = await dio.post(
      targetUrl,
      data: formData,
      options: Options(headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        "access_token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoiSldUIiwibG9naW5faWQiOiJyb2JpbiIsIm1lbV91aWQiOjE4LCJpYXQiOjE2OTkyNDEzODcsImV4cCI6MTY5OTI0MTQ0N30.CGrLZIu_GHwn4NJ3LrO_WFWLchrJQy9vLlsp7lmf0PA",
        "refresh_token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoiSldUIiwibG9naW5faWQiOiJyb2JpbiIsIm1lbV91aWQiOjE4LCJpYXQiOjE2OTkyNDEzODcsImV4cCI6MTY5OTMyNzc4N30.yyddamAqkk_82IISOv5B9rs2xbY1Ja5SLegBwgeJsz8",
      }),
    );

    if (response.statusCode == 200) {
      final responseData = response.data;
      final json_ = responseData;

      if (json_ != null && json_['result'] == 'OK') {
        final data_ = json_['data'];
        final member = AttendanceModel.fromJson(data_);
        return member;
      }
    }

    throw Exception('Failed to fetch member information');
  }
}
