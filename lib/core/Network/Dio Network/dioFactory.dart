import 'package:dio/dio.dart';
import 'package:e_commerce/core/Network/apiConstant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  Dio? _dio;
  Dio get dio {
    if (_dio != null) {
      return _dio!;
    }
    _dio = Dio(BaseOptions())
      ..interceptors.add(PrettyDioLogger(
          error: true, requestBody: true, responseBody: true, request: true));
    return _dio!;
  }
}
