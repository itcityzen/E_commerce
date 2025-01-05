import 'package:e_commerce/core/Network/apiResult.dart';
import 'package:e_commerce/features/Login/Data/Model/LoginRequestBodyModel.dart';
import 'package:e_commerce/features/Login/Data/Model/LoginResponseModel.dart';
import 'package:e_commerce/features/Login/Data/Repository/LoginRepositoryImplementation.dart';

abstract class LoginRepository {
  Future<ApiResult<LoginResponseModel>> loginUser(
      {required LoginRequestBodyModel loginRequest});
}
