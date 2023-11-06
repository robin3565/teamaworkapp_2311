import 'package:dio/dio.dart';
import 'package:teama_work_app_new/models/lateness.dart';

class LatenessRepository {
  static const targetUrl =
      'http://server.teama.company/penalty/get_penalty_list';
  static final dio = Dio();

  static Future<LatenessModel> getLatenessInfo(
    // osType,
    // deviceId,
    // appVersion,
    fMonth,
    fYear,
    page,
  ) async {
    final formData = {
      // 'os_type': osType,
      // 'device_id': deviceId,
      // 'app_version': appVersion,
      'search_Y': fYear,
      'search_M': fMonth,
      'page': page,
      'is_postman': 'Y',
    };

    final response = await dio.post(
      targetUrl,
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          "access_token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoiSldUIiwibG9naW5faWQiOiJyb2JpbiIsIm1lbV91aWQiOjE4LCJpYXQiOjE2OTkyMzQ5NDQsImV4cCI6MTY5OTIzNTAwNH0.K2DTu3Z3WmRJp0yznXe8_yjaDpH3YTT1Bu97CSONcWQ",
          "refresh_token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoiSldUIiwibG9naW5faWQiOiJyb2JpbiIsIm1lbV91aWQiOjE4LCJpYXQiOjE2OTkyMzQ5NDQsImV4cCI6MTY5OTMyMTM0NH0.g_E7Qykeni5w8j3WuS8icN0_TY8e-2JEGNohPSi9zs8",
        },
      ),
    );

    if (response.statusCode == 200) {
      final responseData = response.data;
      final json_ = responseData;

      if (json_ != null && json_['result'] == 'OK') {
        final data_ = json_['data'];
        final lateness = LatenessModel.fromJson(data_);
        return lateness;
      }
    }

    throw Exception('Failed to fetch member information');
  }
}
