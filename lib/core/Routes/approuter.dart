import 'package:e_commerce/core/cacheHelper/cacheHelper.dart';
import 'package:e_commerce/features/Home/Data/Model/ProductResponse.dart';
import 'package:e_commerce/features/Home/UI/HomeScreen.dart';
import 'package:e_commerce/features/Home/UI/ProductDetails.dart';
import 'package:e_commerce/features/Login/UI/Screens/loginScreen.dart';
import 'package:e_commerce/features/Register/UI/Screens/RegisterScreen.dart';
import 'package:go_router/go_router.dart';

class ConstantRouter {
  static const String homeScreen = "/home";
  static const String splash = "/";
  static const String loginScreen = "/login";
  static const String registerScreen = "/register";
  static const String productDetails = "/productDetails";
}

class AppRouter {
  static final GoRouter router = GoRouter(
      initialLocation:
          isLogin ? ConstantRouter.loginScreen : ConstantRouter.loginScreen,
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
              return ProductDetails(product: product);
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
