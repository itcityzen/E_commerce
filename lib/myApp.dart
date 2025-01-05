import 'package:e_commerce/AppLogic/Localization/localization_cubit.dart';
import 'package:e_commerce/AppLogic/Theme/theme_cubit.dart';
import 'package:e_commerce/core/Routes/approuter.dart';
import 'package:e_commerce/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (context, state) {
            context.read<LocalizationCubit>().LastLoadedLanguage(context);
            return ScreenUtilInit(
              minTextAdapt: true,
              designSize: Size(360, 690),
              builder: (context, child) {
                return MaterialApp.router(
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: state.locale,
                  debugShowCheckedModeBanner: false,
                  routerConfig: AppRouter.router,
                  theme: state is ThemeisDark
                      ? ThemeData.dark()
                      : ThemeData.light(),
                );
              },
            );
          },
        );
      },
    );
  }
}
