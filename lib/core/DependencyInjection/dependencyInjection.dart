import 'package:dio/dio.dart';
import 'package:e_commerce/core/Network/Dio%20Network/dioFactory.dart';
import 'package:e_commerce/core/Network/Dio%20Network/dioService.dart';
import 'package:e_commerce/core/Network/apiConsumer.dart';
import 'package:e_commerce/features/Cart/Data/Repository/Cart%20Repository%20Implementation.dart';
import 'package:e_commerce/features/Cart/Data/Repository/Cart%20Repository.dart';
import 'package:e_commerce/features/Cart/Data/Repository/LocalCartRepository.dart';
import 'package:e_commerce/features/Cart/Logic/cart_cubit.dart';
import 'package:e_commerce/features/Home/Data/Repository/HomeRepository.dart';
import 'package:e_commerce/features/Home/Data/Repository/HomeRepositoryImplementation.dart';
import 'package:e_commerce/features/Home/Logic/home_cubit.dart';
import 'package:e_commerce/features/Home/Logic/productofcategory_cubit.dart';
import 'package:e_commerce/features/Login/Data/Repository/LoginRepository.dart';
import 'package:e_commerce/features/Login/Data/Repository/LoginRepositoryImplementation.dart';
import 'package:e_commerce/features/Login/Logic/login_cubit.dart';
import 'package:e_commerce/features/Payment/Address/Logic/address_cubit.dart';
import 'package:e_commerce/features/Payment/Address/Repository/address%20repository%20implementaion.dart';
import 'package:e_commerce/features/Payment/Address/Repository/address%20repository.dart';
import 'package:e_commerce/features/Payment/Data/Repository/PaymentRepository.dart';
import 'package:e_commerce/features/Payment/Data/Repository/PaymentRepositoryImplementation.dart';
import 'package:e_commerce/features/Payment/Logic/payment_cubit.dart';
import 'package:e_commerce/features/Register/Data/Repository/RegisterRepository.dart';
import 'package:e_commerce/features/Register/Data/Repository/RegisterResponseImplementation.dart';
import 'package:e_commerce/features/Register/Logic/register_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerLazySingleton<Dio>(() => DioFactory().dio);
  getIt.registerLazySingleton<ApiConsumer>(() => DioService(dio: getIt<Dio>()));

  getIt.registerFactory<LoginRepository>(
      () => LoginRepositoryImplementation(getIt<ApiConsumer>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepository>()));

  getIt.registerFactory<RegisterRepository>(
      () => RegisterRepositoryImplementation(getIt<ApiConsumer>()));
  getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(getIt<RegisterRepository>()));
  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImplementation(getIt<ApiConsumer>()));
  getIt.registerLazySingleton<HomeCubit>(
      () => HomeCubit(getIt<HomeRepository>()));

  getIt.registerLazySingleton<ProductofcategoryCubit>(
      () => ProductofcategoryCubit(getIt<HomeRepository>()));

  getIt.registerLazySingleton<AddressRepository>(
      () => AddressRepositoryImplementation());

  getIt.registerFactory<AddressCubit>(
      () => AddressCubit(getIt<AddressRepository>()));

  getIt.registerLazySingleton<PaymentRepository>(
      () => PaymentRepositoryImplementation(getIt<ApiConsumer>()));

  getIt.registerFactory<PaymentCubit>(
      () => PaymentCubit(getIt<PaymentRepository>()));

  getIt.registerLazySingleton<CartRepository>(
      () => LocalCartRepositoryImplementation());

  getIt.registerFactory<CartCubit>(() => CartCubit(getIt<CartRepository>()));
}
