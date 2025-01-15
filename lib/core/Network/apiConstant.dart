class ApiConstants {
  static const String apiBaseUrl = "https://dummyjson.com";
  static const String loginEndPoint = "$apiBaseUrl/auth/login";
  static const String registerEndPoint = "$apiBaseUrl/users/add";
  static const String categoryListEndPoint =
      "$apiBaseUrl/products/category-list";
  static const String productEndPoint = "$apiBaseUrl/products";
  static const String productOfCategory = "$apiBaseUrl/products/category";
  static const String Cart = "$apiBaseUrl/carts";
  static const String EndPointAddCart = "/add";

  //STRIPEPAYMENT
  static const String stripePublishKey =
      "pk_test_51QglIhJQL1NKPRcOG1YHIYRb4hamgOP7Se86mDcXR8zp6zgliQIuvdqE5EdheiR5h2BwkxzNDhhZXcthsJb5G9c1005HV2Jye2";

  static const String apiStripeUrl =
      "https://api.stripe.com/v1/payment_intents";
  static const String StripeToken =
      "sk_test_51QglIhJQL1NKPRcOwrnOe2BjOZUWPtPQRc2VsuRIqz6iLACwZrLPmjhVHpoG5Z0NuIgSyxiq5HCg9GeHOHl6DoNh00lbwrsSEl";
}
