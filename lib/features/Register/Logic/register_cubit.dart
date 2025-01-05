import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/Register/Data/Model/RegisterRequestModel.dart';
import 'package:e_commerce/features/Register/Data/Model/RegisterResponseModel.dart';
import 'package:e_commerce/features/Register/Data/Repository/RegisterRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterRepository registerRepository;
  RegisterCubit(this.registerRepository) : super(RegisterInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  Future Register() async {
    emit(RegisterLoading());
    if (!keyForm.currentState!.validate()) {
      return;
    }

    RegisterRequestModel registerRequestModel =
        RegisterRequestModel(emailController.text, passwordController.text);
    try {
      final result = await registerRepository.registerUser(
          registerRequest: registerRequestModel);
      if (result.isSuccess) {
        emit(RegisterSuccess(result.Data!));
      } else if (result.isError) {
        emit(RegisterError(result.Error!));
      }
    } catch (e) {
      emit(RegisterError('Fail to get data $e'));
    }
  }
}
