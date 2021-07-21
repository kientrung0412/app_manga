import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppApi {
  static late Dio dio;
  static const String BASE_URL = 'http://www.nettruyenvip.com/';

  AppApi._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: 15000,
      ),
    )..interceptors.add(PrettyDioLogger());
  }

  static final AppApi _instance = AppApi._internal();

  factory AppApi() {
    return _instance;
  }
}
