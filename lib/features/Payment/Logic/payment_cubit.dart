import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/Network/apiResult.dart';
import 'package:e_commerce/features/Payment/Data/Model/PaymentRequestBodyModel.dart';
import 'package:e_commerce/features/Payment/Data/Repository/PaymentRepository.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentRepository paymentRepository;
  PaymentCubit(this.paymentRepository) : super(PaymentInitial());

  Future mainPayment(double amount) async {
    emit(PaymentLoading());
    try {
      PaymentRequestBodyModel input =
          PaymentRequestBodyModel(amount: amount.toInt(), currency: 'usd');

      var Result = await paymentRepository.createPayment(input);
      if (Result.isSuccess) {
        await paymentRepository.initPaymentSheet(Result.Data!.clientSecret!);
        await paymentRepository.displayPaymentSheet();
        emit(PaymentSuccess());
      } else {
        emit(PaymentError(Result.Error));
      }
    } catch (e) {emit(PaymentError('Fail to Payment $e '));}
  }
}
