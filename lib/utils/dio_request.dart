import 'package:dio/dio.dart';
import 'package:fitpage_stock_scan_task/utils/api_constants.dart';

class Request {
  static Dio createApiClient({Function()? onError}) {
    final BaseOptions networkOptions = ApiConstants.networkOptions;
    Dio dio = Dio(networkOptions);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Do something before request is sent
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Do something with response data
        return handler.next(response);
      },
      onError: (e, handler) {
        // Do something with response error
        if (onError != null) {
          onError();
        }

        // You can customize the error handling based on the DioExceptionType
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          // Handle timeout errors
          print('Request Timeout: $e');
        } else if (e.type == DioExceptionType.badResponse) {
          // Handle non-2xx HTTP response errors
          print('HTTP Error Response: $e');
        } else {
          // Handle other DioExceptionType
          print('Dio Error: $e');
        }

        return handler.reject(e);
      },
    ));

    return dio;
  }
}
