part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  RegisterResponseModel responseModel;
  RegisterSuccess(this.responseModel);
}

final class RegisterError extends RegisterState {
  String Failure;

  RegisterError(this.Failure);
}
