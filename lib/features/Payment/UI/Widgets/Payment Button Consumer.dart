import 'package:e_commerce/core/Widgets/CustomButton.dart';
import 'package:e_commerce/core/Widgets/Loading_widget.dart';
import 'package:e_commerce/core/Widgets/dialog.dart';
import 'package:e_commerce/features/Payment/Logic/payment_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentButtonConsumer extends StatelessWidget {
  double amount;
  PaymentButtonConsumer({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(builder: (context, state) {
      if (state is PaymentLoading) {
        return PrettyLoadingWidget();
      }
      return CustomButton(
          text: 'Payment',
          onPressed: () {
            context.read<PaymentCubit>().mainPayment(amount);
          });
    }, listener: (context, state) {
      if (state is PaymentSuccess) {
        DialogManager.showSuccessDialog(
            context: context,
            title: 'Payment Success',
            description: 'Your Transaction Done',
            onPress: () {});
      }
      if (state is PaymentError) {
        DialogManager.showErrorDialog(
            context: context,
            title: 'Payment Error',
            description: 'Your Transaction Failed',
            onPress: () {});
      }
    });
  }
}
