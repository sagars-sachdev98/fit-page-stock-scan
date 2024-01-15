import 'package:dio/dio.dart';
import 'package:fitpage_stock_scan_task/utils/dio_request.dart';

class ApiRestHelper {
  static Future<List<Map<String, dynamic>>> getDataList(
      {Map<String, dynamic> queryParameters = const {},
      required String endPoint,
      Function()? onError}) async {
    Response? response;

    Dio? dio = Request.createApiClient(onError: onError);
    response = await dio.get(
      endPoint,
      queryParameters: queryParameters,
    );
    List<Map<String, dynamic>> apiResponse = response.data != null
        ? (response.data as List).map((e) => e as Map<String, dynamic>).toList()
        : [];
    return apiResponse;
  }
}
