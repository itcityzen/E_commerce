import 'package:e_commerce/core/Network/apiConstant.dart';
import 'package:e_commerce/core/Network/apiConsumer.dart';
import 'package:e_commerce/core/Network/apiResult.dart';
import 'package:e_commerce/features/Login/Data/Model/LoginRequestBodyModel.dart';
import 'package:e_commerce/features/Login/Data/Model/LoginResponseModel.dart';
import 'package:e_commerce/features/Login/Data/Repository/LoginRepository.dart';

class LoginRepositoryImplementation implements LoginRepository {
  ApiConsumer apiConsumer;

  LoginRepositoryImplementation(this.apiConsumer);

  @override
  Future<ApiResult<LoginResponseModel>> loginUser(
      {required LoginRequestBodyModel loginRequest}) async {
    try {
      var data = await apiConsumer.post(ApiConstants.loginEndPoint,
          Body: loginRequest.toJson());
      return ApiResult.Success(LoginResponseModel.fromJson(data));
    } catch (e) {
      return ApiResult.Error('Fail $e');
    }
  }
}
