import 'package:dio/dio.dart';
import 'package:e_commerce/AppLogic/Localization/localization_cubit.dart';
import 'package:e_commerce/AppLogic/Theme/theme_cubit.dart';
import 'package:e_commerce/core/DependencyInjection/dependencyInjection.dart';
import 'package:e_commerce/core/Network/Dio%20Network/dioFactory.dart';
import 'package:e_commerce/core/Network/Dio%20Network/dioService.dart';
import 'package:e_commerce/core/Network/apiConstant.dart';
import 'package:e_commerce/core/Network/apiConsumer.dart';
import 'package:e_commerce/core/Routes/approuter.dart';
import 'package:e_commerce/core/cacheHelper/cacheHelper.dart';
import 'package:e_commerce/features/Cart/Logic/cart_cubit.dart';
import 'package:e_commerce/features/Home/Logic/home_cubit.dart';
import 'package:e_commerce/features/Home/Logic/productofcategory_cubit.dart';
import 'package:e_commerce/features/Login/Data/Repository/LoginRepositoryImplementation.dart';
import 'package:e_commerce/features/Login/Logic/login_cubit.dart';
import 'package:e_commerce/features/Payment/Address/Logic/address_cubit.dart';
import 'package:e_commerce/features/Payment/Logic/payment_cubit.dart';
import 'package:e_commerce/features/Register/Logic/register_cubit.dart';
import 'package:e_commerce/generated/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'myApp.dart';
import 'package:e_commerce/core/Network/Dio Network/dioFactory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  setup();
  await EasyLocalization.ensureInitialized();
  await checklogin();
  Stripe.publishableKey = ApiConstants.stripePublishKey;

  runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    assetLoader: CodegenLoader(),
    fallbackLocale: Locale('en'),
    child: MultiBlocProvider(providers: [
      BlocProvider(create: (context) => getIt<LoginCubit>()),
      BlocProvider(create: (context) => getIt<RegisterCubit>()),
      BlocProvider(create: (context) => getIt<HomeCubit>()..HomeData()),
      BlocProvider(create: (context) => LocalizationCubit()),
      BlocProvider(create: (context) => ThemeCubit()),
      BlocProvider(create: (context) => getIt<ProductofcategoryCubit>()),
      BlocProvider(create: (context) => getIt<AddressCubit>()),
      BlocProvider(create: (context) => getIt<PaymentCubit>()),
      BlocProvider(create: (context) => getIt<CartCubit>())
    ], child: MyApp()),
  ));
}
