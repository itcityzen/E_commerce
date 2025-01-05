import 'package:e_commerce/core/Widgets/CustomButton.dart';
import 'package:e_commerce/core/Widgets/CustomFormTextField.dart';
import 'package:e_commerce/features/Register/Logic/register_cubit.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class formRegister extends StatelessWidget {
  const formRegister({super.key});

  @override
  Widget build(BuildContext context) {
    var Cubit = context.read<RegisterCubit>();

    return Form(
        key: Cubit.keyForm,
        child: Column(
          children: [
            CustomFormTextField(
                hintText: 'Email',
                labelText: 'Email',
                controller: Cubit.emailController),
            SizedBox(
              height: 30.h,
            ),
            CustomFormTextField(
                hintText: 'Password',
                labelText: 'Password',
                controller: Cubit.passwordController)
          ],
        ));
  }
}
