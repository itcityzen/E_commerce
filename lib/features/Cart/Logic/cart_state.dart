part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  CartResponse cart;

  CartSuccess(this.cart);
}

final class CartError extends CartState {
  String Error;

  CartError(this.Error);
}
