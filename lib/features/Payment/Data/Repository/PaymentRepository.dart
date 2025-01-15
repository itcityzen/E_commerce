import 'package:e_commerce/core/Network/apiResult.dart';
import 'package:e_commerce/features/Payment/Data/Model/PaymentIntentModelResponse.dart';
import 'package:e_commerce/features/Payment/Data/Model/PaymentRequestBodyModel.dart';

abstract class PaymentRepository {
//api
  Future<ApiResult<PaymentIntentModelResponse>> createPayment(
      PaymentRequestBodyModel input);
  //initPaymentSheet
  Future<void> initPaymentSheet(String clientSecret);
  Future<void> displayPaymentSheet();
}
