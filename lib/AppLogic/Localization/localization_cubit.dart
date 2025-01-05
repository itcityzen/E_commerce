import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  LastLoadedLanguage(BuildContext context) {
    final lastloadedLang = state.locale;
    emit(LocalizationChanged(lastloadedLang));
  }

  changeLanguage(BuildContext context) {
    final currentLanguage = state.locale;
    final newLanguage;
    if (currentLanguage.languageCode == 'en') {
      newLanguage = Locale('ar');
    } else {
      newLanguage = Locale('en');
    }
    emit(LocalizationChanged(newLanguage));

    context.setLocale(newLanguage);
  }
}
