import 'package:e_commerce/AppLogic/Localization/localization_cubit.dart';
import 'package:e_commerce/core/Widgets/CustomButton.dart';
import 'package:e_commerce/core/Widgets/CustomFormTextField.dart';
import 'package:e_commerce/features/Login/Logic/login_cubit.dart';
import 'package:e_commerce/generated/locale_keys.g.dart';
import 'package:e_commerce/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Formlogin extends StatelessWidget {
  const Formlogin({super.key});

  @override
  Widget build(BuildContext context) {
    var Cubit = context.read<LoginCubit>();

    return Form(
        key: Cubit.keyForm,
        child: Column(
          children: [
            CustomFormTextField(
                hintText: LocaleKeys.Authentication_user_name.tr(),
                labelText: LocaleKeys.Authentication_user_name.tr(),
                controller: Cubit.usernameController),
            SizedBox(
              height: 10.h,
            ),
            CustomFormTextField(
                hintText: LocaleKeys.Authentication_password.tr(),
                labelText:  LocaleKeys.Authentication_password.tr(),
                controller: Cubit.passwordController)
          ],
        ));
  }
}
