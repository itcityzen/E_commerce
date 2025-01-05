import 'package:dio/dio.dart';
import 'package:e_commerce/core/Network/apiConstant.dart';
import 'package:e_commerce/core/Network/apiConsumer.dart';
import 'package:e_commerce/core/Network/apiError.dart';

class DioService implements ApiConsumer {
  Dio dio;

  DioService({required this.dio});

  @override
  Future get(String Url, {Map<String, dynamic>? QueryParameters}) async {
    try {
      var Response = await dio.get(Url, queryParameters: QueryParameters);
      return Response.data;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  @override
  Future post(String Url, {Map<String, dynamic>? Body}) async {
    try {
      var Response = await dio.post(Url, data: Body);
      return Response.data;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
