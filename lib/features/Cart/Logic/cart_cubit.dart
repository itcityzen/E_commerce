import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/Cart/Data/Model/CartResponse.dart';
import 'package:e_commerce/features/Cart/Data/Model/CartProduct.dart';
import 'package:e_commerce/features/Cart/Data/Repository/Cart%20Repository.dart';
import 'package:e_commerce/features/Home/Data/Model/ProductResponse.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartRepository cartRepository;
  CartCubit(this.cartRepository) : super(CartInitial());

  Future getCart() async {
    emit(CartLoading());
    final result = await cartRepository.getCart();
    if (result.isSuccess) {
      emit(CartSuccess(result.Data!));
    } else {
      emit(CartError(result.Error!));
    }
  }

  Future addCart(Product product) async {
    CartProduct cartProduct = CartProduct(
        id: product.id!,
        title: product.title!,
        price: product.price!,
        quantity: 1,
        total: product.price!,
        discountPercentage: product.discountPercentage!,
        discountedTotal: product.price!,
        thumbnail: product.thumbnail!);

    final result = await cartRepository.addProduct(cartProduct);
    if (result.isSuccess) {
      emit(CartSuccess(result.Data!));
    } else {
      emit(CartError(result.Error!));
    }
  }

  Future updateCart(int productID, int quantity) async {
    final result = await cartRepository.updateProduct(productID, quantity);
    if (result.isSuccess) {
      emit(CartSuccess(result.Data!));
    } else {
      emit(CartError(result.Error!));
    }
  }

  Future removeCart(int productID) async {
    final result = await cartRepository.removeProduct(productID);
    if (result.isSuccess) {
      emit(CartSuccess(result.Data!));
    } else {
      emit(CartError(result.Error!));
    }
  }

  Future deleteCart() async {
    try {
      emit(CartLoading());
      await cartRepository.deleteCart();
      emit(CartInitial());
    } catch (e) {
      emit(CartError('Error to delete this cart $e'));
    }
  }
}
