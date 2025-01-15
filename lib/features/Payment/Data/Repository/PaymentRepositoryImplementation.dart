import 'package:dio/dio.dart';
import 'package:e_commerce/core/Network/apiConstant.dart';
import 'package:e_commerce/core/Network/apiConsumer.dart';
import 'package:e_commerce/core/Network/apiResult.dart';
import 'package:e_commerce/features/Payment/Data/Model/PaymentIntentModelResponse.dart';
import 'package:e_commerce/features/Payment/Data/Model/PaymentRequestBodyModel.dart';
import 'package:e_commerce/features/Payment/Data/Repository/PaymentRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentRepositoryImplementation implements PaymentRepository {
  ApiConsumer apiConsumer;

  PaymentRepositoryImplementation(this.apiConsumer);

  @override
  Future<ApiResult<PaymentIntentModelResponse>> createPayment(
      PaymentRequestBodyModel input) async {
    try {
      var data = await apiConsumer.post(ApiConstants.apiStripeUrl,
          Body: input.toJson(),
          options: Options(
              contentType: Headers.formUrlEncodedContentType,
              headers: {
                "Authorization": "Bearer ${ApiConstants.StripeToken}"
              }));
      return ApiResult.Success(PaymentIntentModelResponse.fromJson(data));
    } catch (e) {
      return ApiResult.Error('Failed to create Payment $e');
    }
  }

  @override
  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  @override
  Future<void> initPaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            merchantDisplayName: 'E-Commerce',
            paymentIntentClientSecret: clientSecret,
            appearance: PaymentSheetAppearance(
                colors: PaymentSheetAppearanceColors(
              background: Colors.lightBlue,
              primary: Colors.blue,
              componentBorder: Colors.red,
            ))));
  }
}
