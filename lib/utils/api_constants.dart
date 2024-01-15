import 'package:dio/dio.dart';

class ApiConstants {
  static const String baseUrl = 'http://coding-assignment.bombayrunning.com/';
  static const String stockScansEndpoint = '/data.json';

  static final BaseOptions networkOptions = BaseOptions(
    baseUrl: baseUrl,
    responseType: ResponseType.json,
    contentType: 'application/json',
    connectTimeout: const Duration(milliseconds: 10000),
  );
}
