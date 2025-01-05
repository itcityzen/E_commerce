import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/cacheHelper/cacheHelper.dart';
import 'package:e_commerce/features/Login/Data/Model/LoginRequestBodyModel.dart';
import 'package:e_commerce/features/Login/Data/Model/LoginResponseModel.dart';
import 'package:e_commerce/features/Login/Data/Repository/LoginRepositoryImplementation.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../Data/Repository/LoginRepository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepository loginRepository;

  LoginCubit(this.loginRepository) : super(LoginInitial());
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  Future Login() async {
    emit(LoginLoading());
    if (!keyForm.currentState!.validate()) {
      return;
    }

    LoginRequestBodyModel loginRequestBodyModel =
        LoginRequestBodyModel(usernameController.text, passwordController.text);

    try {
      final result =
          await loginRepository.loginUser(loginRequest: loginRequestBodyModel);
      if (result.isSuccess) {
        await SharedPreferencesHelper.setId(result.Data!.id!);

        emit(LoginSuccess(result.Data!));
      } else {
        if (result.isError) {
          emit(LoginError(result.Error!));
        }
      }
    } catch (e) {
      emit(LoginError(' Error is $e'));
    }
  }
}
