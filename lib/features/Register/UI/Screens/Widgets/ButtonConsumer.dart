import 'package:e_commerce/core/Routes/approuter.dart';
import 'package:e_commerce/core/Widgets/CustomButton.dart';
import 'package:e_commerce/core/Widgets/Loading_widget.dart';
import 'package:e_commerce/core/Widgets/dialog.dart';
import 'package:e_commerce/features/Register/Logic/register_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterButtonConsumer extends StatelessWidget {
  const RegisterButtonConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        builder: (context, state) {
      if (state is RegisterLoading) {
        return PrettyLoadingWidget();
      }
      return CustomButton(
          text: 'Register ', onPressed: context.read<RegisterCubit>().Register);
    }, listener: (context, state) {
      if (state is RegisterSuccess) {
        DialogManager.showSuccessDialog(
            context: context,
            title: 'Register Done ',
            description: 'Welcome ${state.responseModel.username}',
            onPress: () {
              context.go(ConstantRouter.loginScreen);
            });
      }
      if (state is RegisterError) {
        DialogManager.showErrorDialog(
            context: context,
            title: 'Failed to Register',
            description: 'Fail to register ${state.Failure}',
            onPress: () {});
      }
    });
  }
}
