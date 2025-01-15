class PaymentRequestBodyModel {
  int amount;
  String currency;

  PaymentRequestBodyModel({required this.amount, required this.currency});

  Map<String, dynamic> toJson() {
    return {
      "amount": amount*100,
      "currency": currency,
    };
  }
}
