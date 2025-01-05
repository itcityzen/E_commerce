import 'package:e_commerce/core/Network/apiConstant.dart';
import 'package:e_commerce/core/Network/apiConsumer.dart';
import 'package:e_commerce/core/Network/apiResult.dart';
import 'package:e_commerce/features/Register/Data/Model/RegisterRequestModel.dart';
import 'package:e_commerce/features/Register/Data/Model/RegisterResponseModel.dart';
import 'package:e_commerce/features/Register/Data/Repository/RegisterRepository.dart';

class RegisterRepositoryImplementation implements RegisterRepository {
  ApiConsumer apiConsumer;

  RegisterRepositoryImplementation(this.apiConsumer);

  @override
  Future<ApiResult<RegisterResponseModel>> registerUser(
      {required RegisterRequestModel registerRequest}) async {
    try {
      var data = await apiConsumer.post(ApiConstants.registerEndPoint,
          Body: registerRequest.toJson());
      return ApiResult.Success(RegisterResponseModel.fromJson(data));
    } catch (e) {
      return ApiResult.Error('Error $e ');
    }
  }
}
