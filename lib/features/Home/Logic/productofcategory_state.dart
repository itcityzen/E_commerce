part of 'productofcategory_cubit.dart';

@immutable
sealed class ProductofcategoryState {}

final class ProductofcategoryInitial extends ProductofcategoryState {}

final class ProductofcategoryLoading extends ProductofcategoryState {}

final class ProductofcategorySuccess extends ProductofcategoryState {
  List<Product> productsCategory;

  ProductofcategorySuccess(this.productsCategory);
}

final class ProductofcategoryError extends ProductofcategoryState {
  String Failure;
  ProductofcategoryError(this.Failure);
}
