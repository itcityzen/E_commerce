import 'package:dio/dio.dart';
import 'package:e_commerce/core/Network/Dio%20Network/dioFactory.dart';
import 'package:e_commerce/core/Network/Dio%20Network/dioService.dart';
import 'package:e_commerce/core/Network/apiConsumer.dart';
import 'package:e_commerce/features/Home/Data/Repository/HomeRepository.dart';
import 'package:e_commerce/features/Home/Data/Repository/HomeRepositoryImplementation.dart';
import 'package:e_commerce/features/Home/Logic/home_cubit.dart';
import 'package:e_commerce/features/Login/Data/Repository/LoginRepository.dart';
import 'package:e_commerce/features/Login/Data/Repository/LoginRepositoryImplementation.dart';
import 'package:e_commerce/features/Login/Logic/login_cubit.dart';
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
}
