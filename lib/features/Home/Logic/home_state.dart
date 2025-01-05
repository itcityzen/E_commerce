part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  List<String> category;
  List<Product> products;

  HomeSuccess(this.category, this.products );
}

final class HomeError extends HomeState {
  String Failure;

  HomeError(this.Failure);
}
