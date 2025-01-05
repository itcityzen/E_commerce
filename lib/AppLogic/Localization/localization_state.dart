part of 'localization_cubit.dart';

@immutable
sealed class LocalizationState {
  Locale locale;

  LocalizationState(this.locale);
}

final class LocalizationInitial extends LocalizationState {
  LocalizationInitial() : super(Locale('en'));
}

final class LocalizationChanged extends LocalizationState {
  LocalizationChanged(super.locale);
}
