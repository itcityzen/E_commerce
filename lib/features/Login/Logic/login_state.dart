part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  LoginResponseModel loginResponseModel;

  LoginSuccess(this.loginResponseModel);
}

final class LoginError extends LoginState {
  String Failure;

  LoginError(this.Failure);
}
