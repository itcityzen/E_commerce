import 'package:e_commerce/core/Network/apiResult.dart';
import 'package:e_commerce/features/Register/Data/Model/RegisterRequestModel.dart';
import 'package:e_commerce/features/Register/Data/Model/RegisterResponseModel.dart';

abstract class RegisterRepository {
  Future<ApiResult<RegisterResponseModel>> registerUser(
      {required RegisterRequestModel registerRequest});
}
