part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressSuccess extends AddressState {
  String Address;

  AddressSuccess(this.Address);
}

final class AddressError extends AddressState {
  String Error;

  AddressError(this.Error);
}
