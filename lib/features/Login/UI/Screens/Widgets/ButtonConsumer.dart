import 'package:e_commerce/AppLogic/Localization/localization_cubit.dart';
import 'package:e_commerce/core/Routes/approuter.dart';
import 'package:e_commerce/core/Widgets/CustomButton.dart';
import 'package:e_commerce/core/Widgets/Loading_widget.dart';
import 'package:e_commerce/core/Widgets/dialog.dart';
import 'package:e_commerce/features/Login/Logic/login_cubit.dart';
import 'package:e_commerce/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginButtonConsumer extends StatelessWidget {
  const LoginButtonConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
      if (state is LoginLoading) {
        return PrettyLoadingWidget();
      }
      return CustomButton(
          text: LocaleKeys.Authentication_bottom_login.tr(),
          onPressed: context.read<LoginCubit>().Login);
    }, listener: (context, state) {
      if (state is LoginSuccess) {
        DialogManager.showSuccessDialog(
            context: context,
            title: 'Login Success',
            description: 'Welcome ${state.loginResponseModel.username}',
            onPress: () {});
      }
      if (state is LoginError) {
        DialogManager.showErrorDialog(
            context: context,
            title: 'Login Fail',
            description: 'Welcome ${state.Failure}',
            onPress: () {});
      }
    });
  }
}
