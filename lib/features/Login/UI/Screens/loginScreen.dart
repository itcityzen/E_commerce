import 'package:e_commerce/AppLogic/Localization/localization_cubit.dart';
import 'package:e_commerce/AppLogic/Theme/theme_cubit.dart';
import 'package:e_commerce/core/Widgets/CustomButton.dart';
import 'package:e_commerce/features/Home/UI/Screens/widget/category/category%20builder.dart';
import 'package:e_commerce/features/Login/UI/Screens/Widgets/ButtonConsumer.dart';
import 'package:e_commerce/features/Login/UI/Screens/Widgets/formLogin.dart';
import 'package:e_commerce/generated/locale_keys.g.dart';
import 'package:e_commerce/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<ThemeCubit>().ToggleTheme();
              },
              icon: Icon(FontAwesomeIcons.lightbulb)),
          IconButton(
              onPressed: () {
                context.read<LocalizationCubit>().changeLanguage(context);
              },
              icon: Icon(FontAwesomeIcons.language))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(200.r)),
                  child: Image.asset('assets/WELCOME-ST-IVES.jpg')),
              SizedBox(
                height: 20.h,
              ),
              Text(
                LocaleKeys.Authentication_title_Login.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 30.h,
              ),
              Formlogin(),
              SizedBox(
                height: 30.h,
              ),
              LoginButtonConsumer()
            ],
          ),
        ),
      ),
    );
  }
}
