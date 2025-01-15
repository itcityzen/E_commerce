import 'package:e_commerce/core/cacheHelper/cacheHelper.dart';
import 'package:e_commerce/features/Cart/UI/CartScreen.dart';
import 'package:e_commerce/features/Home/Data/Model/ProductResponse.dart';
import 'package:e_commerce/features/Home/UI/HomeScreen.dart';
import 'package:e_commerce/features/Home/UI/Screens/ProductDetails.dart';
import 'package:e_commerce/features/Home/UI/productofCategory.dart';
import 'package:e_commerce/features/Login/UI/Screens/loginScreen.dart';
import 'package:e_commerce/features/Payment/UI/Screens/payment%20Screen.dart';
import 'package:e_commerce/features/Register/UI/Screens/RegisterScreen.dart';
import 'package:go_router/go_router.dart';

class ConstantRouter {
  static const String homeScreen = "/home";
  static const String splash = "/";
  static const String loginScreen = "/login";
  static const String registerScreen = "/register";
  static const String productDetails = "/productDetails";
  static const String productofCategory = "/productofCategory";
  static const String PaymentScreen = "/PaymentScreen";
  static const String cartScreen = "/cartScreen";
}

class AppRouter {
  static final GoRouter router = GoRouter(
      initialLocation:
          isLogin ? ConstantRouter.homeScreen : ConstantRouter.homeScreen,
      routes: [
        GoRoute(
            path: ConstantRouter.registerScreen,
            builder: (context, state) {
              return RegisterScreen();
            }),

        // login
        GoRoute(
          path: ConstantRouter.loginScreen,
          builder: (context, state) {
            return LoginScreen();
          },
        ),
        GoRoute(
            path: ConstantRouter.homeScreen,
            builder: (cotext, state) {
              return HomeScreen();
            }),
        GoRoute(
            path: ConstantRouter.productDetails,
            builder: (context, state) {
              final product = state.extra as Product;
              return ProductDetailsScreen(product: product);
            }),
        GoRoute(
            path: ConstantRouter.productofCategory,
            builder: (context, state) {
              final productofCategory = state.extra as String;
              return ProductofCategory(CategoryName: productofCategory);
            }),
        GoRoute(
            path: ConstantRouter.PaymentScreen,
            builder: (context, state) {
              return PaymentScreen();
            }),
        GoRoute(
            path: ConstantRouter.cartScreen,
            builder: (context, state) {
              return CartScreen();
            }),
      ]);
}

bool isLogin = false;
checklogin() {
  int? id = SharedPreferencesHelper.getId();
  if (id != null) {
    isLogin = true;
  } else {
    isLogin = false;
  }
}
