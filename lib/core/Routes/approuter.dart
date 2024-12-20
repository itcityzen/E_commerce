import 'package:e_commerce/features/Login/UI/Screens/loginScreen.dart';
import 'package:go_router/go_router.dart';

class ConstantRouter {
  static const String homepath = "/home";
  static const String splash = "/";
  static const String loginscreen = "/login";
}

class AppRouter {
  static final GoRouter router =
      GoRouter(initialLocation: ConstantRouter.loginscreen, routes: [
    // login
    GoRoute(
      path: ConstantRouter.loginscreen,
      builder: (context, state) {
        return LoginScreen();
      },
    ),
  ]);
}
