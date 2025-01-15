import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/Home/Data/Model/ProductResponse.dart';
import 'package:e_commerce/features/Home/Data/Repository/HomeRepository.dart';
import 'package:meta/meta.dart';

part 'productofcategory_state.dart';

class ProductofcategoryCubit extends Cubit<ProductofcategoryState> {
  final HomeRepository homeRepository;
  ProductofcategoryCubit(this.homeRepository)
      : super(ProductofcategoryInitial());
  Map<String, List<Product>> productsCategory = {};

  Future<void> productofCategoryData(String categoryName) async {
    emit(ProductofcategoryLoading());
    if (productsCategory.containsKey(categoryName)) {
      emit(ProductofcategorySuccess(productsCategory[categoryName]!));
      return;
    }
    emit(ProductofcategoryLoading());
    try {
      final result = await homeRepository.getProductsOfCategory(categoryName);
      if (result.isSuccess) {
        productsCategory[categoryName] = result.Data!.products!;

        emit(ProductofcategorySuccess(productsCategory[categoryName]!));
      } else {
        emit(ProductofcategoryError(result.Error!));
      }
    } catch (e) {
      emit(ProductofcategoryError('Error $e'));
    }
  }
}
